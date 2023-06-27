import {Dispatch, VisibilityFilters} from "../actions";
import s from "./../styles/Display.module.scss"
import {images} from "../Jobs";
import {JSX, require} from "react";
import close from "./../images/close.png"
import {Box, IconButton} from "@mui/material";
import CloseOutlinedIcon from '@mui/icons-material/CloseOutlined';

interface DisplayProp {
    allJobs: Job[],
    visibilityFilter: VisibilityFilters,
    handleCloseClick: void
}
type Display = (prop: DisplayProp) => void

export const DisplayComponent: Display = ({allJobs, visibilityFilter, handleCloseClick}) => {

    let job = allJobs.find(t => t.isSelected);
    if (job && (visibilityFilter === VisibilityFilters.SHOW_FAVOURITE && !job.isFavourite))
        job = undefined;

    if (!job) return(<Box/>);

    let salaryBlock = <Box className={s.salary}>Зарплата не указана</Box>;
    if (job.minSalary && job.maxSalary) {
        salaryBlock = <Box className={s.salary}>От {job.minSalary} до {job.maxSalary}</Box>
    }
    else {
        if (job.minSalary) salaryBlock = <Box className={s.salary}>От {job.minSalary}</Box>
        else if (job.maxSalary) salaryBlock = <Box className={s.salary}>До {job.maxSalary}</Box>
    }

    return (
        <Box className={s.display}>
            <Box className={s.container}>

                <Box className={s.topBar}>
                    <Box className={s.wrappersWrapper}>
                        <Box className={s.imageWrapper}>
                            <img src={images.find(t => t.id === job.id).src}/>
                        </Box>
                        <Box className={s.headersWrapper}>
                            <Box className={s.titleWrapper}>
                                <Box className={s.title}>{job.title}</Box>
                            </Box>
                            <Box className={s.companyInfoWrapper}>
                                <Box className={s.companyInfo}>{job.companyName} | {job.location}</Box>
                            </Box>
                        </Box>
                    </Box>
                    <Box className={s.closeButtonWrapper}>
                        <IconButton onClick={() => handleCloseClick()}>
                            <CloseOutlinedIcon/>
                            {/*<img src={close}/>*/}
                        </IconButton>
                    </Box>
                </Box>

                {salaryBlock}
                <Box className={s.description}>{job.description}</Box>
            </Box>
        </Box>
    );
}