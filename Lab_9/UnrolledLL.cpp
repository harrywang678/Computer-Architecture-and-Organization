#include "UnrolledLL.h"
using namespace std;

// Name: Harry Wang
// Pledge : I pledge my honor that I have abided by the Stevens Honor System.

uNode::uNode(uNode* prev, u_int64_t blksize) : blksize(blksize) {
    /* Your code here */
    datagrp = new int[blksize]; // Allocating space for datagrp

    for (u_int64_t i = 0; i < blksize; i++){ // Every element in datagrp or in the node are 0.
        datagrp[i] = 0;
    }

    next = nullptr; // the next node would be nullptr
    
    if (prev != nullptr) { // If the previous node is not a nullptr, then the current node is the next node of the previous node.
        prev->next = this;
    }

}

void UnrolledLL::init_ullist(u_int64_t size, u_int64_t blksize) {

    head = new uNode(nullptr,blksize);

    for (u_int64_t i = 1; i < size; i++ ){
        uNode* newNode = new uNode(head,blksize);
    }
    
    len = size; 
}

void UnrolledLL::iterate_ullist() {
    /* Your code here */
    uNode* iterator = head;
    u_int64_t temp = 0;

    while (iterator != nullptr){
        for (u_int64_t i = 0; i < iterator->blksize; i++){
            temp = temp + 1;
        }
        iterator = iterator->next;
    }
}  