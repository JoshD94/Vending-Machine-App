# Cornell Vending  
A convenient and easy-to-use app that locates vending machines around campus and helps you track and purchase items from wherever you are!

<img src="https://github.com/justinlxiang/Vending-Machine-App/assets/40130510/e1fff88b-764a-4be3-92eb-369aa9c11c92" width = "250">    

On the home page, you'll find a list of all of Cornell's vending machines with their location and whether they take Big Red Bucks and cash.  
<img src="https://github.com/justinlxiang/Vending-Machine-App/assets/40130510/d9f32eea-fba6-45a3-9ad8-a31d78690efa" width = "250">  

  

After clicking into a specific vending machine, you'll find a list of items for sale with their price and quantity remaining so you can buy them before they run out!

<img src="https://github.com/justinlxiang/Vending-Machine-App/assets/40130510/b0f3a29a-6a17-4b87-9ff9-619c9f3d7a66" width="250">
<img src="https://github.com/justinlxiang/Vending-Machine-App/assets/40130510/07542d1b-51b6-401e-b989-2b1928b89592" width="250">
<img src="https://github.com/justinlxiang/Vending-Machine-App/assets/40130510/b1153a48-a387-4ece-b972-0590f2265d0c" width="250">      
  

  
  
On the app, you can also navigate to your user profile to view your current balance and transaction history, and add funds if needed!    
<img src="https://github.com/justinlxiang/Vending-Machine-App/assets/40130510/c70a4657-e34b-4709-a8bf-015f57961d14" width="200">
<img src="https://github.com/justinlxiang/Vending-Machine-App/assets/40130510/a2dbaafe-c782-4359-9d0f-8f3e3c0912ba" width="200">
<img src="https://github.com/justinlxiang/Vending-Machine-App/assets/40130510/46231fd6-8fc2-48fc-8665-61796c003a76" width="200">
<img src="https://github.com/justinlxiang/Vending-Machine-App/assets/40130510/fcc1a6f8-b22a-46fa-afe5-3ec048852a3e" width="200">

Our frontend contains multiple screens to navigate between with 3 scrollable pages and networking integration with our backend API to make changes to the data.
We have 15 routes on our backend for creating, updating, and deleting machines, items, and users and making transactions with 4 SQLite tables with a one-to-many relationship between machines and items, machines and transactions, and users and transactions, and a one-to-one relationship between transactions and items.
