import React from "react";
//@ts-ignore
import s from "../Styles.module.css";
import {ProductRowProp} from "../App";

const ProductRow: React.FC<ProductRowProp> = ({product}) => {
    return (
        <tr className={s.product}>
            <td>{product.stocked ? product.name :
                <span style={{color: 'red'}}>
                    {product.name}
                </span>}
            </td>
            <td>{product.price.toString()}</td>
        </tr>
    );
}

export default ProductRow;