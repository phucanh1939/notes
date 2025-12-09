# **Network Protocol**

## **What is a protocol**

The sender and reciever must agree on how the data format so it can pack and parse the data correctly 

A **protocol** is a set of rules that define how devices communicate.

It specifies:

- **Format**: structure of data  
- **Timing / behavior**: when and how to send/receive  
- **Error handling**: how to detect or correct problems  
- **Semantics**: meaning of messages  

Protocols exist at **every layer** of the network.

---

## **Example: HTTP**
- **Format**: request line + headers + body  
- **Behavior**: client sends request → server responds  
- **Error handling**: status codes like 404, 500  
- **Semantics**: GET = retrieve data, POST = send data  

---

## **How applications handle protocols**
- Applications are designed to **expect a specific protocol** on a port.  
- **No protocol type data is explicitly included** in the packet.  
- The **transport layer port number** tells the OS which application receives the data.  
- The application assumes all data it receives follows its protocol.  

**Example:**
- HTTP server listens on TCP port 80  
- Any segment arriving on port 80 is parsed as HTTP  
- Random or malformed data → server fails to parse → error/exception  

---

## **Key idea**
- **Sender**: formats data according to the protocol the receiver expects  
- **Receiver**: assumes data follows the protocol, parses it accordingly  
- **OS/transport layer**: delivers payload to the correct application via port  
