"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const react_1 = __importDefault(require("react"));
//@ts-ignore
const Styles_module_css_1 = __importDefault(require("../Styles.module.css"));
const ProductRow = ({ product }) => {
    return (react_1.default.createElement("tr", { className: Styles_module_css_1.default.product },
        react_1.default.createElement("td", null, product.stocked ? product.name :
            react_1.default.createElement("span", { style: { color: 'red' } }, product.name)),
        react_1.default.createElement("td", null, product.price.toString())));
};
exports.default = ProductRow;
//# sourceMappingURL=ProductRow.js.map