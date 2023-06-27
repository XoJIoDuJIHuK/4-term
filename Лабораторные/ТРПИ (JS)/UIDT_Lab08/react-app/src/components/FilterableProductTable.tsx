import React, {useState} from "react";
import SearchBar from "./SearchBar";
import {FilterableProductTableProp, FilterState} from "../App";
import ProductTable from "./ProductTable";

const FilterableProductTable: React.FC<FilterableProductTableProp> = ({products}) => {
    const [state, setState] = useState<FilterState>({ filterText: '', inStockOnly: false });
    const handleFilterTextChange = (event: React.ChangeEvent<HTMLInputElement>) => {
        setState({ ...state, filterText: event.target.value });
    };
    const handleInStockChange = (event: React.ChangeEvent<HTMLInputElement>) => {
        setState({ ...state, inStockOnly: event.target.checked });
    }

    return (<div>
        <SearchBar
            filterText={state.filterText}
            inStockOnly={state.inStockOnly}
            onFilterTextChange={handleFilterTextChange}
            onInStockChange={handleInStockChange}
        />
        <ProductTable
            products={products}
            filterText={state.filterText}
            inStockOnly={state.inStockOnly}
        />
    </div>);
}

export default FilterableProductTable;