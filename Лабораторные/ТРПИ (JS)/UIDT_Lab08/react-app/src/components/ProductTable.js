"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const react_1 = __importDefault(require("react"));
const ProductCategoryRow_1 = __importDefault(require("./ProductCategoryRow"));
const ProductRow_1 = __importDefault(require("./ProductRow"));
const ProductTable = ({ products, filterText, inStockOnly }) => {
    const rows = [];
    let lastCategory = null;
    products.forEach((product) => {
        if (product.name.indexOf(filterText) === -1) {
            return;
        }
        if (inStockOnly && !product.stocked) {
            return;
        }
        if (product.category !== lastCategory) {
            rows.push(react_1.default.createElement(ProductCategoryRow_1.default, { category: product.category, key: product.category }));
        }
        rows.push(react_1.default.createElement(ProductRow_1.default, { product: product, key: product.name }));
        lastCategory = product.category;
    });
    return (react_1.default.createElement("table", null,
        react_1.default.createElement("thead", null,
            react_1.default.createElement("tr", null,
                react_1.default.createElement("th", null, "Name"),
                react_1.default.createElement("th", null, "Price"))),
        react_1.default.createElement("tbody", null, rows)));
};
exports.default = ProductTable;
//# sourceMappingURL=ProductTable.js.map