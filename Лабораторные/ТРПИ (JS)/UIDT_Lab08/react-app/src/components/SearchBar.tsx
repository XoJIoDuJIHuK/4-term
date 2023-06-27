import React from "react";
// @ts-ignore
import s from "../Styles.module.css";
import {SearchBarProp} from "../App";

const SearchBar: React.FC<SearchBarProp> = ({filterText,
                                                inStockOnly,
                                                onFilterTextChange,
                                                onInStockChange}) => {
    function handleFilterTextChange(event: React.ChangeEvent<HTMLInputElement>) {
        onFilterTextChange(event);
    }
    function handleInStockChange(event: React.ChangeEvent<HTMLInputElement>) {
        onInStockChange(event);
    }
    return (
        <form>
            <input
                type="text"
                placeholder="Search..."
                value={filterText}
                onChange={handleFilterTextChange}
                className={s.searchBar}
            />
            <p>
                <input
                    type="checkbox"
                    checked={inStockOnly}
                    onChange={handleInStockChange}
                />
                {' '}
                Only show products in stock
            </p>
        </form>
    );
}

export default SearchBar;