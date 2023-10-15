package main

import (
	"context"
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"time"

	"github.com/gorilla/mux"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

type User struct {
	UserName string `json:"username"`
	Name     string `json:"name"`
	Password string `json:"password"`
}

type Task struct {
	IsarId       int       `json:"isarId" bson:"isarId"`
	MongoId      string    `json:"mongoId" bson:"mongoId"`
	Title        string    `json:"title" bson:"title"`
	Description  string    `json:"description" bson:"description"`
	Completed    bool      `json:"isCompleted" bson:"isCompleted"`
	LastModified time.Time `json:"modifiedDate" bson:"modifiedDate"`
	CreatedDate  time.Time `json:"createdDate" bson:"createdDate"`
}

var tasks []Task
var client *mongo.Client

const uri = "mongodb://localhost:27017"
const DATABASE = "Task-Management-System"
const COLLECTION = "Tasks"

// Retrieves all tasks documents from the MongoDB Database
func getTasks(responseWriter http.ResponseWriter, request *http.Request) {
	responseWriter.Header().Set("Content-Type", "application/json")

	client = connectToDatabase()
	collection := client.Database(DATABASE).Collection(COLLECTION)
	filters := bson.D{{}}
	cursor, err := collection.Find(context.TODO(), filters)
	if err != nil {
		http.Error(responseWriter, "Couldn't find the record"+err.Error(), http.StatusBadRequest)
		return
	}

	var results []Task
	if err = cursor.All(context.TODO(), &results); err != nil {
		http.Error(responseWriter, "Couldn't assign the records"+err.Error(), http.StatusBadRequest)
		return
	}

	json.NewEncoder(responseWriter).Encode(results)
}

func deleteTask(responseWriter http.ResponseWriter, request *http.Request) {
	responseWriter.Header().Set("Content-Type", "application/json")
	// params := mux.Vars(request)
	// for index, item := range tasks {
	// 	if item.ID == params["id"] {
	// 		tasks = append(tasks[:index], tasks[index+1:]...)
	// 		break
	// 	}
	// }
	json.NewEncoder(responseWriter).Encode(tasks)
}

func getTask(responseWriter http.ResponseWriter, request *http.Request) {
	responseWriter.Header().Set("Content-Type", "application/json")
	params := mux.Vars(request)
	client = connectToDatabase()
	collection := client.Database(DATABASE).Collection(COLLECTION)

	objectId, err := primitive.ObjectIDFromHex(params["id"])
	if err != nil {
		log.Println("Invalid id")
	}
	filters := bson.M{"_id": objectId}
	var task Task
	err = collection.FindOne(context.TODO(), filters).Decode(&task)
	if err != nil {
		http.Error(responseWriter, "Couldn't find the record: "+err.Error(), http.StatusBadRequest)
		return
	}
	json.NewEncoder(responseWriter).Encode(task)
}

func createTask(responseWriter http.ResponseWriter, request *http.Request) {
	responseWriter.Header().Set("Content-Type", "application/json")
	var task Task
	if err := json.NewDecoder(request.Body).Decode(&task); err != nil {
		http.Error(responseWriter, "Invalid JSON"+err.Error(), http.StatusBadRequest)
		log.Printf("error decoding sakura response: %v", err)
		if e, ok := err.(*json.SyntaxError); ok {
			log.Printf("syntax error at byte offset %d", e.Offset)
		}
		log.Printf("sakura response: %q", request.Body)
		return
	}

	client = connectToDatabase()
	collection := client.Database(DATABASE).Collection(COLLECTION)
	result, err := collection.InsertOne(context.TODO(), task)
	if err != nil {
		http.Error(responseWriter, "Couldn't insert task :( "+err.Error(), http.StatusInternalServerError)
		return
	}
	defer closeDatabase(client)
	fmt.Printf("Inserted document with _id: %v\n", result.InsertedID)
	json.NewEncoder(responseWriter).Encode(result.InsertedID)
}

// Updates a task document using its MongoDB _id attribute.
func updateTask(responseWriter http.ResponseWriter, request *http.Request) {
	responseWriter.Header().Set("Content-Type", "application/json")
	params := mux.Vars(request)

	client = connectToDatabase()
	collection := client.Database(DATABASE).Collection(COLLECTION)

	objectId, err := primitive.ObjectIDFromHex(params["id"])
	if err != nil {
		log.Println("Invalid id")
		log.Println(err)
	}

	filter := bson.M{"_id": objectId}

	var task Task
	if err := json.NewDecoder(request.Body).Decode(&task); err != nil {
		http.Error(responseWriter, "Invalid JSON"+err.Error(), http.StatusBadRequest)
		return
	}
	update := bson.M{"$set": task}

	result, err := collection.UpdateOne(context.TODO(), filter, update)
	json.NewEncoder(responseWriter).Encode(result)
}

// Closes the initiated connection to the MongoDB instance.
func closeDatabase(client *mongo.Client) {
	if err := client.Disconnect(context.Background()); err != nil {
		log.Printf("Error closing database connection: %v\n", err)
	}
}

// Initiates a connection to the MongoDB Database and returns its instance.
func connectToDatabase() *mongo.Client {
	serverAPI := options.ServerAPI(options.ServerAPIVersion1)
	opts := options.Client().ApplyURI(uri).SetServerAPIOptions(serverAPI)

	client, err := mongo.Connect(context.TODO(), opts)
	if err != nil {
		panic(err)
	}

	var result bson.M
	if err := client.Database(DATABASE).RunCommand(context.TODO(), bson.D{{Key: "ping", Value: 1}}).Decode(&result); err != nil {
		log.Fatalf("Error pinging database: %v\n", err)
	}

	fmt.Println("Pinged your deployment. You successfully connected to MongoDB!")

	return client
}

func main() {
	router := mux.NewRouter()

	tasks = append(tasks, Task{Title: "Task 1", Description: "Description 1", CreatedDate: time.Now()})

	router.HandleFunc("/tasks", getTasks).Methods("GET")
	router.HandleFunc("/tasks/{id}", getTask).Methods("GET")
	router.HandleFunc("/tasks", createTask).Methods("POST")
	router.HandleFunc("/tasks/{id}", updateTask).Methods("PUT")
	router.HandleFunc("/tasks/{id}", deleteTask).Methods("DELETE")

	fmt.Printf("Starting server at port 8000\n")
	log.Fatal(http.ListenAndServe(":8000", router))
}
