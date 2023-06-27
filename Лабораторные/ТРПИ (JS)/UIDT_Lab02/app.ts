class Footwear
{
    public id : number = 0;
    public size : number = 0;
    public color : string = "0";
    public price : number = 0;

    private discount : number = 0;
    private _finalPrice : number = 0;
    public get finalPrice() : number
    {
        return this._finalPrice;
    }
    public set finalPrice(n : number)
    {
        if (n > 0)
        {
            this._finalPrice = n;
            this.discount = (this.price - this.finalPrice) / this.price;
        }
        else
        {
            this._finalPrice = 0;
            this.discount = 1;
        }
    }

    constructor()
    {
        this.id = GenerateId();

        Object.defineProperty(this, this.id, {configurable : false, writable : false});
        Object.defineProperty(this, this.color, {writable : false});
        Object.defineProperty(this, this.size, {writable : false});
    }

    toString()
    {
        return `id: ${this.id} size: ${this.size} color: ${this.color} price: ${this.price}` +
        ` discount: ${this.discount * 100}% final price: ${this.finalPrice}`;
    }
}

class ProductsVault implements Iterable<Footwear> {
    constructor(
        public components: Footwear[]
    ) {}

    [Symbol.iterator]() {
        let pointer = 0;
        let components = this.components;

        return {
            next(): IteratorResult<Footwear> {
                if (pointer < components.length) {
                    return {
                        done: false,
                        value: components[pointer++],
                    };
                } else {
                    return {
                        done: true,
                        value: null,
                    };
                }
            },
        };
    }
}

let idSet : Set<number> = new Set<number>();
function GenerateId() : number
{
    let id : number = Math.round(Math.random() * 100);
    while (idSet.has(id))
    {
        id = Math.round(Math.random() * 100);
    }
    idSet.add(id);
    return id;
}

class Boots extends Footwear
{
    constructor()
    {
        super();
        this.size = Math.round(Math.random() * 5 + 42);
        this.price = Math.round(Math.random() * 50 + 100);
        this.color = "Black";
        this.finalPrice = this.price;
    }
    toString()
    {
        return super.toString();
    }
}
class Sneakers extends Footwear
{
    constructor()
    {
        super();
        this.size = Math.round(Math.random() * 4 + 41);
        this.price = Math.round(Math.random() * 200 + 100);
        this.color = "Red";
        this.finalPrice = this.price;
    }
    toString()
    {
        return super.toString();
    }
}
class Sandals extends Footwear
{
    constructor()
    {
        super();
        this.size = Math.round(Math.random() * 6 + 38);
        this.price = Math.round(Math.random() * 20 + 30);
        this.color = "Brown";
        this.finalPrice = this.price;
    }
    toString()
    {
        return super.toString();
    }
}

function GetProductsByPriceDiapason(products: ProductsVault, min: number, max: number)
{
    for (let i = 0; i < products.components.length; i++)
    {
        if (products.components[i].price >= min && products.components[i].price <= max)
        {
            console.log(i.toString());
        }
    }
}

function GetProductsBySize(products: ProductsVault, size: number)
{
    for (let i = 0; i < products.components.length; i++)
    {
        if (products.components[i].size == size)
        {
            console.log(i.toString());
        }
    }
}

function GetProductsByColor(products: ProductsVault, color: string)
{
    for (let i = 0; i < products.components.length; i++)
    {
        if (products.components[i].color == color)
        {
            console.log(i.toString());
        }
    }
}

let products = new ProductsVault([new Boots(), new Sneakers(), new Sandals()]);

console.log(products.components.length);
for (let item of products)
{
    console.log(item.toString());
}

console.log("Get products by price diapason:");
GetProductsByPriceDiapason(products, 200, 250);

console.log("Get products by color:");
GetProductsByColor(products, "Red");

console.log("Get products by size:");
GetProductsBySize(products, 42);

console.log("Task 5");
console.log(products.components[0].finalPrice)
products.components[0].finalPrice = 900;
console.log(products.components[0].toString())