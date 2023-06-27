"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const react_1 = __importDefault(require("react"));
// @ts-ignore
const Styles_module_css_1 = __importDefault(require("../Styles.module.css"));
const SearchBar = ({ filterText, inStockOnly, onFilterTextChange, onInStockChange }) => {
    function handleFilterTextChange(event) {
        onFilterTextChange(event);
    }
    function handleInStockChange(event) {
        onInStockChange(event);
    }
    return (react_1.default.createElement("form", null,
        react_1.default.createElement("input", { type: "text", placeholder: "Search...", value: filterText, onChange: handleFilterTextChange, className: Styles_module_css_1.default.searchBar }),
        react_1.default.createElement("p", null,
            react_1.default.createElement("input", { type: "checkbox", checked: inStockOnly, onChange: handleInStockChange }),
            ' ',
            "Only show products in stock")));
};
exports.default = SearchBar;
//# sourceMappingURL=SearchBar.js.map