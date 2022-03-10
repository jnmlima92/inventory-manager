##### Prerequisites
- Docker and Docker compose already installed

##### 1. Check out the repository

```bash
git clone git@github.com:jnmlima92/inventory-manager.git
```

##### 2. Create and setup the database

Run the following commands in application path to create and setup the database.

```bash
docker-compose build
docker-compose run --rm inventory-manager.web bundle exec rake db:setup
```

##### 3. Start the Rails server

You can start the rails server using the command given below.

```bash
docker-compose up
```

And now you can visit the site with the URL http://localhost:3000

##### 4. Running tests

```bash
docker-compose run --rm inventory-manager.web rspec .
```


------------------
### Como utilizar o Gerenciador de estoque

### Criar estoques
É possível criar estoques através da chamada **POST** para a url _/inventories_.
|Parâmetros| |
|-|-
|name|`obrigatório`
```bash
curl -H "Content-Type: application/json" -d '{"inventory": {"name": "Estoque 01254"}}' -X POST http://localhost:3000/inventories
```
### Visualizar estoques
É possível visualizar todos os estoques registrados através de uma chamada **GET** para _/inventories_.
```bash
curl -X GET http://localhost:3000/inventories
```
### Visualizar um estoque
É possível visualizar um estoque registrado através de uma chamada **GET** para _/inventories_/:id_do_estoque.
```bash
curl -X GET http://localhost:3000/inventories/1
```
### Atualizar um estoque
É possível atualizar um estoque registrado através de uma chamada **PUT** para _/inventories_/:id_do_estoque.
```bash
curl -H "Content-Type: application/json" -d '{"inventory": {"name": "Estoque 54123"}}' -X PUT http://localhost:3000/inventories/1
```
### Excluir um estoque
É possível excluir um estoque registrado através de uma chamada **DELETE** para _/inventories_/:id_do_estoque.
```bash
curl -H "Content-Type: application/json" -X DELETE http://localhost:3000/inventories/1
```

### Criar uma entrada de lote
É possível criar uma entrada de lote através de uma chamada **POST** para _/merchandise_receipts_.
|Parâmetros|Requisito|Conteúdo|
|-|-|-|
|receipt_date|`obrigatório`|Timestamp|
|unit|`obrigatório`|Enum ("in_kilo, "in_ton")|
|merchandise_lots_attributes'|`obrigatório`|Array { name, height, unit, inventory_id| }|
```bash
url -H "Content-Type: application/json" -d '{"merchandise_receipt": {"receipt_date": "2022-03-09 22:12:25 -0300", "unit": "in_ton", "merchandise_lots_attributes": [{"name": "teste 1", "height": "15.2", "unit": "in_kilo", "inventory_id": "2"}]}}' -X POST http://localhost:3000/merchandise_receipts
```

### Visualizar uma entrada de lote
É possível visualizar um registro de entrada de lote através de uma chamada **GET** para _/merchandise_receipts/:id_da_entrada_.

```bash
curl -X GET http://localhost:3000/merchandise_receipts/1
```
