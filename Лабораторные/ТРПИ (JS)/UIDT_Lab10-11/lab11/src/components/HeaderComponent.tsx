import {useState} from "react";
import {ActionBool, DispatchBool} from "../actions";
import {Link} from "@mui/material";
import s from "./../styles/Header.module.scss"
import {Box, IconButton} from "@mui/material";

type THeaderComponent = (prop: HeaderProp) => JSX.Element
type HeaderProp = {
    showFavourites: boolean,
    handleButtonClick: DispatchBool
}

const HeaderComponent: THeaderComponent = ({ showFavourites, handleButtonClick }) => {

    const [showNavButtons, setNavButtonsVisibility] = useState(false);

    return (
        <Box className={s.container}>

            <Box className={s.flexContainer}>
                <Box className={s.header}>FRONTEND <span style={{color: 'blue'}}>JOB</span></Box>
                <Box className={s.buttonsWrapper}>
                    <Link className={s.button} underline="none"
                        onClick={() => {handleButtonClick(false)}}
                        style={{ fontWeight: 'bold', color: !showFavourites ? 'rgba(0, 112, 251, 1)' :
                                'rgba(107, 131, 151, 1)'}}>
                        Поиск вакансий
                    </Link>
                    <Link underline="none"
                        className={s.button}
                        onClick={() => {handleButtonClick(true)}}
                        style={{ fontWeight: 'bold', color: showFavourites ? 'rgba(0, 112, 251, 1)' :
                                'rgba(107, 131, 151, 1)'}}>
                        Избранные вакансии
                    </Link>
                </Box>
            </Box>
        </Box>
    );
};

export default HeaderComponent;