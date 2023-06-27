import './App.css'
import {Battalions} from "./Battalions.js";
import {
    Box,
    Button,
    Card,
    CardContent,
    Drawer, List, ListItem,
    ListItemButton,
    ListItemText,
    TextField,
    Typography
} from "@mui/material"
import healthIcon from "./images/Stat Icons/health.png"
import organizationIcon from "./images/Stat Icons/organization.png"
import MenuIcon from '@mui/icons-material/Menu';
import softAttackIcon from "./images/Stat Icons/soft attack.png"
import hardAttackIcon from "./images/Stat Icons/hard attack.png"
import {SaveOutlined, SearchOffOutlined, SearchOutlined} from "@mui/icons-material";
import * as React from "react"
import {useState} from "react";

function App() {

    const [state, setState] = useState({
        left: false,
    })

    const toggleDrawer = (anchor, open) => (event) => {
        if (event.type === 'keydown' && (event.key === 'Tab' || event.key === 'Shift')) {
            return;
        }

        setState({ ...state, [anchor]: open });
    };

    const list = (anchor) => (
        <Box
            sx={{ width: anchor === 'top' || anchor === 'bottom' ? 'auto' : 250 }}
            role="presentation"
            onClick={toggleDrawer(anchor, false)}
            onKeyDown={toggleDrawer(anchor, false)}
        >
            <List>
                {['Главная страница', 'Конструктор армий', 'Редактор дивизий', 'Редактор модификаторов'].map((text, index) => (
                    <ListItem key={text} disablePadding>
                        <ListItemButton>
                            <ListItemText primary={text} />
                        </ListItemButton>
                    </ListItem>
                ))}
            </List>
        </Box>
    );

    return (
        <>
            <div style={{width: '80vw'}} id={"central-column"}>
                <Box id={"top-bar"} sx={{width: "100%", height: "40px", display: "flex", justifyContent: "space-between",
                    alignItems: "center", backgroundColor: "#475448", padding: "15px", borderRadius: "10px",
                    marginBottom: "15px"}}>
                    <Box>
                        {['left'].map((anchor) => (
                            <React.Fragment key={anchor}>
                                <Button onClick={toggleDrawer(anchor, true)}>
                                    <MenuIcon/>
                                </Button>
                                <Drawer
                                    anchor={anchor}
                                    open={state[anchor]}
                                    onClose={toggleDrawer(anchor, false)}
                                >
                                    {list(anchor)}
                                </Drawer>
                            </React.Fragment>
                        ))}
                    </Box>
                    <Box>
                        <img src={healthIcon} style={{width: "20px", marginRight: "10px"}}/>
                        <Typography color={"black"} fontWeight={700}>
                            Прочность
                        </Typography>
                    </Box>
                    <Box display={"flex"} justifyContent={"flex-start"} alignItems={"center"} sx={{backgroundColor: "#F2EC9B",
                        borderRadius: "5px", padding: "10px", height: "100%"}}>
                        <img src={organizationIcon} style={{width: "20px", marginRight: "10px"}}/>
                        <Typography color={"black"} fontWeight={700}>
                            Организация
                        </Typography>
                    </Box>
                    <Box display={"flex"} justifyContent={"flex-start"} alignItems={"center"} sx={{backgroundColor: "#F2EC9B",
                        borderRadius: "5px", padding: "10px", height: "100%"}}>
                        <img src={softAttackIcon} style={{width: "20px", marginRight: "10px"}}/>
                        <Typography color={"black"} fontWeight={700}>
                            ПП-атака
                        </Typography>
                    </Box>
                    <Box display={"flex"} justifyContent={"flex-start"} alignItems={"center"} sx={{backgroundColor: "#F2EC9B",
                        borderRadius: "5px", padding: "10px", height: "100%"}}>
                        <img src={hardAttackIcon} style={{width: "20px", marginRight: "10px"}}/>
                        <Typography color={"black"} fontWeight={700}>
                            ПТ-атака
                        </Typography>
                    </Box>
                    <Box>
                        <Button sx={{backgroundColor: "#F2EC9B", height: "100%"}}>
                            <SaveOutlined/>
                        </Button>
                    </Box>
                    <Box>
                        <Button sx={{backgroundColor: "#F2EC9B", height: "100%"}}>
                            <SearchOutlined/>
                        </Button>
                    </Box>
                </Box>

                <div id={"items"} style={{display: "block", width: "100%"}}>
                    {Battalions.map(battalion => <Card key={battalion.name} sx={{width: "300px", display: "inline-block",
                        margin: "10px", backgroundColor: "#475448"}}>
                        <CardContent sx={{padding: "10px"}}>
                            <Box display={"flex"} justifyContent={"space-between"} alignItems={"center"}
                                 marginBottom={"20px"} sx={{backgroundColor: "#668266", padding: "10px",
                                borderRadius: "2px", height: "50px"}}>
                                <img src={battalion.icon}/>
                                <Typography  sx={{color: "white", width: "100%"}}>
                                    {battalion.name}
                                </Typography>
                            </Box>
                            <Box display={"grid"} gridTemplateColumns={"auto auto"} gap={"5px"} sx={{
                                backgroundColor: "white", padding: "5px", borderRadius: "2px"}}>
                                <Box display={"flex"} justifyContent={"flex-start"} alignItems={"center"}>
                                    <img src={healthIcon} style={{marginRight: "5px", width: "20px"}}/>
                                    <TextField value={(Math.random() * 2 + 1).toFixed(2)}/>
                                </Box>
                                <Box display={"flex"} justifyContent={"flex-start"} alignItems={"center"}>
                                    <img src={organizationIcon} style={{marginRight: "5px", width: "20px"}}/>
                                    <TextField value={(Math.random() * 3 + 2).toFixed(2)}/>
                                </Box>
                                <Box display={"flex"} justifyContent={"flex-start"} alignItems={"center"}>
                                    <img src={softAttackIcon} style={{marginRight: "5px", width: "20px"}}/>
                                    <TextField value={(Math.random() + 1).toFixed(2)}/>
                                </Box>
                                <Box display={"flex"} justifyContent={"flex-start"} alignItems={"center"}>
                                    <img src={hardAttackIcon} style={{marginRight: "5px", width: "20px"}}/>
                                    <TextField value={(Math.random() + 1.5).toFixed(2)}/>
                                </Box>
                            </Box>
                        </CardContent>
                    </Card>)}
                </div>
            </div>
        </>
    )
}

export default App
