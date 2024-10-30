#include <stdio.h>
#include <stdlib.h>
#define MAX 5

int Queue[MAX];
int front = -1;
int rear = -1;

void enqueue(int value)
{
    // Check if the queue is full
    if((front == 0 && rear == MAX - 1) || (rear == (front - 1) % (MAX - 1)))
    {
        printf("Queue is full! Cannot insert\n");
    }
    else
    {
        // First element insertion
        if(front == -1)
        {
            front = rear = 0;
            Queue[rear] = value;
        }
        else if(rear == MAX - 1 && front != 0) // Wrap around condition
        {
            rear = 0;
            Queue[rear] = value;
        }
        else
        {
            rear++;
            Queue[rear] = value;
        }
        printf("Inserted %d into queue\n", value);
    }
}

void dequeue()
{
    if(front == -1)
    {
        printf("Queue is empty\n");
    }
    else
    {
        int dequeue_element = Queue[front];
        printf("Deleted %d from queue\n", dequeue_element);

        // Queue has only one element, reset to initial state
        if(front == rear)
        {
            front = rear = -1;
        }
        else if(front == MAX - 1) // Wrap around condition
        {
            front = 0;
        }
        else
        {
            front++;
        }
    }
}

void traversal()
{
    if(front == -1)
    {
        printf("Queue is empty\n");
    }
    else
    {
        printf("Queue elements: ");
        if(rear >= front)
        {
            for(int i = front; i <= rear; i++)
            {
                printf("%d ", Queue[i]);
            }
        }
        else
        {
            for(int i = front; i < MAX; i++)
            {
                printf("%d ", Queue[i]);
            }
            for(int i = 0; i <= rear; i++)
            {
                printf("%d ", Queue[i]);
            }
        }
        printf("\n");
    }
}

int main()
{
    int choice, value;
    do {
        printf("\n1. Enqueue\n2. Dequeue\n3. Traversal\n4. Exit\n");
        scanf("%d", &choice);
        switch(choice)
        {
            case 1:
                printf("Enter element to insert: \n");
                scanf("%d", &value);
                enqueue(value);
                break;
            case 2:
                dequeue();
                break;
            case 3:
                traversal();
                break;
            case 4:
                exit(0);
                break;
            default:
                printf("Invalid choice\n");
                break;
        }
    } while(choice != 4);
    
    return 0;
}
