import React from "react";
import {ProductCategoryRowProp} from "../App";


const ProductCategoryRow: React.FC<ProductCategoryRowProp> = ({category}) => {
    return (
        <tr>
            <th colSpan={2}>
                {category}
            </th>
        </tr>
    );
}

export default ProductCategoryRow;