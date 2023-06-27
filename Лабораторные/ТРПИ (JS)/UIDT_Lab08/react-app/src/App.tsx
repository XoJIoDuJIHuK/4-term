import React from "react";
import PRODUCTS from './Products';
import FilterableProductTable from './components/FilterableProductTable';

export type Product = {
    category: string,
    price: string,
    stocked: boolean,
    name: string
}

export interface ProductRowProp {
    product: Product
}
export interface ProductTableProp {
    products: Product[],
    filterText: string,
    inStockOnly: boolean
}
export interface SearchBarProp {
    filterText: string,
    inStockOnly: boolean,
    onFilterTextChange(event: React.ChangeEvent<HTMLInputElement>): void,
    onInStockChange(event: React.ChangeEvent<HTMLInputElement>): void
}
export interface FilterableProductTableProp {
    products: Product[]
}
export interface FilterState {
    filterText: string,
    inStockOnly: boolean
}
export interface ProductCategoryRowProp {
    category: string
}

const App: () => void = () => {

    return (
        <FilterableProductTable products={PRODUCTS} />
    );
}

export default App;