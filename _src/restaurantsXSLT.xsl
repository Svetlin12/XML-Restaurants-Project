<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Каталог на ресторанти в България</title>
                <link rel="stylesheet" type="text/css" href="restaurantsStyle.css"/>
                <script src="restaurantsFunctions.js" async="true"/>
            </head>
            <body>
                <h1>Каталог на ресторанти в България</h1>
                <div class="navigationBar">
                    <a class="active">Сортиране по:</a>
                    <a class="default" href="#lexicographicalSort" onclick="toggleNameSort()">Име</a>
                    <a href="#numSeatsSort" onclick="toggleNumSeatsSort()">Брой места</a>
                    <a href="#priceRangeSort" onclick="togglePriceRangeSort()">Ценова категория</a>
                    <a href="#regionSort" onclick="toggleRegionSort()">Региони</a>
                    <a class="lastElem" href="#citySort" onclick="toggleCitySort()">Градове</a>
                </div>

                <div id="lexicographicalSort" style="display:inline">
                    <xsl:call-template name="sortByName"/>
                </div>

                <div id="numSeatsSort" style="display:none">
                    <xsl:call-template name="sortByNumSeats"/>
                </div>

                <div id="priceRangeSort" style="display:none">
                    <xsl:call-template name="sortByPriceRange"/>
                </div>

                <div id="regionSort" style="display:none">
                    <xsl:call-template name="sortByRegion"/>
                </div>

                <div id="citySort" style="display:none">
                    <xsl:call-template name="sortByCity"/>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="sortByName">
        <xsl:for-each select="restaurantCatalog/restaurant">
            <xsl:sort select="name"/>

            <div class="rest">
                <h2><xsl:value-of select="name"/></h2>

                <div class="info">
                    <div class="image">
                        <img src="{picture/@link}.jpg"/>
                    </div>

                    <div class="nonImageInfo">
                        <div class="description">
                            <h4>Град:</h4>
                            <p><xsl:value-of select="city"/></p>

                            <h4>Регион:</h4>
                            <p><xsl:value-of select="region"/></p>

                            <h4>Адрес:</h4>
                            <p><xsl:value-of select="address"/></p>

                            <h4>Номер:</h4>
                            <p><xsl:value-of select="phoneNumber"/></p>

                            <p/>
                            <a href="{website/@href}" target="_blank" rel="noopener noreferrer"><xsl:value-of select="website"/></a>
                        </div>

                        <div class="additionalInfo">
                            <div class="menu">
                                <h4>Места▼</h4>
                                <div class="menu-content">
                                    <p>Вътре: <xsl:value-of select="numSeats/indoor/text()"/></p>
                                    <p>Бар: <xsl:value-of select="numSeats/bar/text()"/></p>
                                    <p>Навън: <xsl:value-of select="numSeats/outdoor/text()"/></p>
                                </div>
                            </div>

                            <h4>Ценова категория:</h4>
                            <p><xsl:value-of select="priceCategory"/></p>

                            <h4>Тип на ресторанта:</h4>
                            <p id="type"><xsl:value-of select="typeOfRestaurant"/></p>

                            <div class="menu">
                                <h4>Видове храни▼</h4>
                                <div class="menu-content">
                                    <xsl:for-each select="typesOfFood/type">
                                        <p><xsl:value-of select="text()"/></p>
                                    </xsl:for-each>
                                </div>
                            </div>


                            <div class="menu">
                                <h4>Услуги▼</h4>
                                <div class="menu-content">
                                    <xsl:for-each select="services/service">
                                        <p><xsl:value-of select="text()"/></p>
                                    </xsl:for-each>
                                </div>
                            </div>

                            <div class="menu">
                                <h4>Видове плащания▼</h4>
                                <div class="menu-content">
                                    <xsl:for-each select="payments/pay">
                                        <p><xsl:value-of select="text()"/></p>
                                    </xsl:for-each>
                                </div>
                            </div>

                            <xsl:if test="music">
                                <div class="menu">
                                    <h4>Видове музика▼</h4>
                                    <div class="menu-content">
                                        <xsl:for-each select="music/genre">
                                            <p><xsl:value-of select="text()"/></p>
                                        </xsl:for-each>
                                    </div>
                                </div>
                            </xsl:if>

                        </div>
                    </div>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="sortByNumSeats">
        <xsl:for-each select="restaurantCatalog/restaurant">
            <xsl:sort select="numSeats/@all"/>

            <div class="rest">
                <h2><xsl:value-of select="name"/></h2>

                <div class="info">
                    <div class="image">
                        <img src="{picture/@link}.jpg"/>
                    </div>

                    <div class="nonImageInfo">
                        <div class="description">
                            <h4>Град:</h4>
                            <p><xsl:value-of select="city"/></p>

                            <h4>Регион:</h4>
                            <p><xsl:value-of select="region"/></p>

                            <h4>Адрес:</h4>
                            <p><xsl:value-of select="address"/></p>

                            <h4>Номер:</h4>
                            <p><xsl:value-of select="phoneNumber"/></p>

                            <p/>
                            <a href="{website/@href}" target="_blank" rel="noopener noreferrer"><xsl:value-of select="website"/></a>
                        </div>

                        <div class="additionalInfo">
                            <div class="menu">
                                <h4>Места▼</h4>
                                <div class="menu-content">
                                    <p>Вътре: <xsl:value-of select="numSeats/indoor/text()"/></p>
                                    <p>Бар: <xsl:value-of select="numSeats/bar/text()"/></p>
                                    <p>Навън: <xsl:value-of select="numSeats/outdoor/text()"/></p>
                                </div>
                            </div>

                            <h4>Ценова категория:</h4>
                            <p><xsl:value-of select="priceCategory"/></p>

                            <h4>Тип на ресторанта:</h4>
                            <p id="type"><xsl:value-of select="typeOfRestaurant"/></p>

                            <div class="menu">
                                <h4>Видове храни▼</h4>
                                <div class="menu-content">
                                    <xsl:for-each select="typesOfFood/type">
                                        <p><xsl:value-of select="text()"/></p>
                                    </xsl:for-each>
                                </div>
                            </div>


                            <div class="menu">
                                <h4>Услуги▼</h4>
                                <div class="menu-content">
                                    <xsl:for-each select="services/service">
                                        <p><xsl:value-of select="text()"/></p>
                                    </xsl:for-each>
                                </div>
                            </div>

                            <div class="menu">
                                <h4>Видове плащания▼</h4>
                                <div class="menu-content">
                                    <xsl:for-each select="payments/pay">
                                        <p><xsl:value-of select="text()"/></p>
                                    </xsl:for-each>
                                </div>
                            </div>

                            <xsl:if test="music">
                            <div class="menu">
                                <h4>Видове музика▼</h4>
                                <div class="menu-content">
                                    <xsl:for-each select="music/genre">
                                        <p><xsl:value-of select="text()"/></p>
                                    </xsl:for-each>
                                </div>
                            </div>
                            </xsl:if>

                        </div>
                    </div>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="sortByPriceRange">
        <xsl:for-each select="restaurantCatalog/restaurant">
            <xsl:sort select="priceCategory"/>

            <div class="rest">
                <h2><xsl:value-of select="name"/></h2>

                <div class="info">
                    <div class="image">
                        <img src="{picture/@link}.jpg"/>
                    </div>

                    <div class="nonImageInfo">
                        <div class="description">
                            <h4>Град:</h4>
                            <p><xsl:value-of select="city"/></p>

                            <h4>Регион:</h4>
                            <p><xsl:value-of select="region"/></p>

                            <h4>Адрес:</h4>
                            <p><xsl:value-of select="address"/></p>

                            <h4>Номер:</h4>
                            <p><xsl:value-of select="phoneNumber"/></p>

                            <p/>
                            <a href="{website/@href}" target="_blank" rel="noopener noreferrer"><xsl:value-of select="website"/></a>
                        </div>

                        <div class="additionalInfo">
                            <div class="menu">
                                <h4>Места▼</h4>
                                <div class="menu-content">
                                    <p>Вътре: <xsl:value-of select="numSeats/indoor/text()"/></p>
                                    <p>Бар: <xsl:value-of select="numSeats/bar/text()"/></p>
                                    <p>Навън: <xsl:value-of select="numSeats/outdoor/text()"/></p>
                                </div>
                            </div>

                            <h4>Ценова категория:</h4>
                            <p><xsl:value-of select="priceCategory"/></p>

                            <h4>Тип на ресторанта:</h4>
                            <p id="type"><xsl:value-of select="typeOfRestaurant"/></p>

                            <div class="menu">
                                <h4>Видове храни▼</h4>
                                <div class="menu-content">
                                    <xsl:for-each select="typesOfFood/type">
                                        <p><xsl:value-of select="text()"/></p>
                                    </xsl:for-each>
                                </div>
                            </div>


                            <div class="menu">
                                <h4>Услуги▼</h4>
                                <div class="menu-content">
                                    <xsl:for-each select="services/service">
                                        <p><xsl:value-of select="text()"/></p>
                                    </xsl:for-each>
                                </div>
                            </div>

                            <div class="menu">
                                <h4>Видове плащания▼</h4>
                                <div class="menu-content">
                                    <xsl:for-each select="payments/pay">
                                        <p><xsl:value-of select="text()"/></p>
                                    </xsl:for-each>
                                </div>
                            </div>

                            <xsl:if test="music">
                                <div class="menu">
                                    <h4>Видове музика▼</h4>
                                    <div class="menu-content">
                                        <xsl:for-each select="music/genre">
                                            <p><xsl:value-of select="text()"/></p>
                                        </xsl:for-each>
                                    </div>
                                </div>
                            </xsl:if>

                        </div>
                    </div>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="sortByRegion">
        <xsl:for-each select="restaurantCatalog/restaurant">
            <xsl:sort select="region"/>

            <div class="rest">
                <h2><xsl:value-of select="name"/></h2>

                <div class="info">
                    <div class="image">
                        <img src="{picture/@link}.jpg"/>
                    </div>

                    <div class="nonImageInfo">
                        <div class="description">
                            <h4>Град:</h4>
                            <p><xsl:value-of select="city"/></p>

                            <h4>Регион:</h4>
                            <p><xsl:value-of select="region"/></p>

                            <h4>Адрес:</h4>
                            <p><xsl:value-of select="address"/></p>

                            <h4>Номер:</h4>
                            <p><xsl:value-of select="phoneNumber"/></p>

                            <p/>
                            <a href="{website/@href}" target="_blank" rel="noopener noreferrer"><xsl:value-of select="website"/></a>
                        </div>

                        <div class="additionalInfo">
                            <div class="menu">
                                <h4>Места▼</h4>
                                <div class="menu-content">
                                    <p>Вътре: <xsl:value-of select="numSeats/indoor/text()"/></p>
                                    <p>Бар: <xsl:value-of select="numSeats/bar/text()"/></p>
                                    <p>Навън: <xsl:value-of select="numSeats/outdoor/text()"/></p>
                                </div>
                            </div>

                            <h4>Ценова категория:</h4>
                            <p><xsl:value-of select="priceCategory"/></p>

                            <h4>Тип на ресторанта:</h4>
                            <p id="type"><xsl:value-of select="typeOfRestaurant"/></p>

                            <div class="menu">
                                <h4>Видове храни▼</h4>
                                <div class="menu-content">
                                    <xsl:for-each select="typesOfFood/type">
                                        <p><xsl:value-of select="text()"/></p>
                                    </xsl:for-each>
                                </div>
                            </div>


                            <div class="menu">
                                <h4>Услуги▼</h4>
                                <div class="menu-content">
                                    <xsl:for-each select="services/service">
                                        <p><xsl:value-of select="text()"/></p>
                                    </xsl:for-each>
                                </div>
                            </div>

                            <div class="menu">
                                <h4>Видове плащания▼</h4>
                                <div class="menu-content">
                                    <xsl:for-each select="payments/pay">
                                        <p><xsl:value-of select="text()"/></p>
                                    </xsl:for-each>
                                </div>
                            </div>

                            <xsl:if test="music">
                                <div class="menu">
                                    <h4>Видове музика▼</h4>
                                    <div class="menu-content">
                                        <xsl:for-each select="music/genre">
                                            <p><xsl:value-of select="text()"/></p>
                                        </xsl:for-each>
                                    </div>
                                </div>
                            </xsl:if>

                        </div>
                    </div>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="sortByCity">
        <xsl:for-each select="restaurantCatalog/restaurant">
            <xsl:sort select="city"/>

            <div class="rest">
                <h2><xsl:value-of select="name"/></h2>

                <div class="info">
                    <div class="image">
                        <img src="{picture/@link}.jpg"/>
                    </div>

                    <div class="nonImageInfo">
                        <div class="description">
                            <h4>Град:</h4>
                            <p><xsl:value-of select="city"/></p>

                            <h4>Регион:</h4>
                            <p><xsl:value-of select="region"/></p>

                            <h4>Адрес:</h4>
                            <p><xsl:value-of select="address"/></p>

                            <h4>Номер:</h4>
                            <p><xsl:value-of select="phoneNumber"/></p>

                            <p/>
                            <a href="{website/@href}" target="_blank" rel="noopener noreferrer"><xsl:value-of select="website"/></a>
                        </div>

                        <div class="additionalInfo">
                            <div class="menu">
                                <h4>Места▼</h4>
                                <div class="menu-content">
                                    <p>Вътре: <xsl:value-of select="numSeats/indoor/text()"/></p>
                                    <p>Бар: <xsl:value-of select="numSeats/bar/text()"/></p>
                                    <p>Навън: <xsl:value-of select="numSeats/outdoor/text()"/></p>
                                </div>
                            </div>

                            <h4>Ценова категория:</h4>
                            <p><xsl:value-of select="priceCategory"/></p>

                            <h4>Тип на ресторанта:</h4>
                            <p id="type"><xsl:value-of select="typeOfRestaurant"/></p>

                            <div class="menu">
                                <h4>Видове храни▼</h4>
                                <div class="menu-content">
                                    <xsl:for-each select="typesOfFood/type">
                                        <p><xsl:value-of select="text()"/></p>
                                    </xsl:for-each>
                                </div>
                            </div>


                            <div class="menu">
                                <h4>Услуги▼</h4>
                                <div class="menu-content">
                                    <xsl:for-each select="services/service">
                                        <p><xsl:value-of select="text()"/></p>
                                    </xsl:for-each>
                                </div>
                            </div>

                            <div class="menu">
                                <h4>Видове плащания▼</h4>
                                <div class="menu-content">
                                    <xsl:for-each select="payments/pay">
                                        <p><xsl:value-of select="text()"/></p>
                                    </xsl:for-each>
                                </div>
                            </div>

                            <xsl:if test="music">
                                <div class="menu">
                                    <h4>Видове музика▼</h4>
                                    <div class="menu-content">
                                        <xsl:for-each select="music/genre">
                                            <p><xsl:value-of select="text()"/></p>
                                        </xsl:for-each>
                                    </div>
                                </div>
                            </xsl:if>

                        </div>
                    </div>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
