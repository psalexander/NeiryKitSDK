# NeiryKitSDK

## Overview

Неофициальный фрейворк для работы с устройствами компании Neiry. Фреймворк является оберткой над основным SDK компании, который называется CapsuleClient. 
Фреймворк работает только с ios. SDK тестировался мало, гарантий стабильной работы нет.

## Инициализация sdk

Для работы с устройствами требуется подключить динамическую библиотеку NeiryKit.framework в проект. Внутри фреймворка находится файл официальной библиотеки CapsuleClient.framework, который также нужно подключить как динамическую бибилиотеку.

## Разрешения

Чтобы фреймворк мог взаимодействовать с устройствами по bluetooth, требуется прописать разрешения в plist файле.

```
<key>NSBluetoothAlwaysUsageDescription</key>
<string>Для работы с устройстввами Neiry</string>
```

## Код интеграции

Для начала создаем объект SDK

```
let neiry = Neiry()
```

Указываем делегат

```
neiry.delegate = self
```

Вызываем функцию ``Neiry/create(address:name:type:)`` для создание объекта CapsuleClient

```
neiry.create(address: .inprocess, name: "Test sdk", type: TYPE_HEADBAND)
```

Для запуска поиска bluetooth устройств нужно вызвать метод ``Neiry/requestDevices()``

```
neiry.requestDevices()
```

И ловить в делегате в методе ``NeiryDelegate/onDevices(devices:)`` список найденых устройств.

```
func onDevices(devices: [NeiryDevice]) {
    
}
```

Этот список можно отобразить на экране и дать пользователю выбрать и подключить устройство.

```
neiry.connect(to: device)
```

После успешного подключения в делегат начнут приходить сырые данные.

```
func onMEMSData(samples: [NeiryMEMSData]) {
    
}

func onEEGData(samples: [NeiryEEGData]) {
    
}

func onPPGData(samples: [NeiryPPGData]) {
    
}
```

## Пример

К SDK прилагается пример подключения ``NeiryKit``. Проект называется NeiryApp. Вся работа с ``NeiryKit`` происходит в классе NeiryManager.  

## Делегат

``NeiryDelegate/onError(message:)`` - метод вызывается при ошибках. 

``NeiryDelegate/onLog(message:)`` - метод вызывается когда, что-то логируется в ``NeiryKit``. Разработчик сам может решать, что нужно логировать.

``NeiryDelegate/onDisconnected()`` - метод вызывается при отключении устройства.

``NeiryDelegate/onConnected(device:channels:)`` - метод вызывается, когда устройство подключено.

``NeiryDelegate/onDevices(devices:)`` - метод вызывается когда SDK найдет список устройств.

``NeiryDelegate/onMEMSData(samples:)`` - метод вызывается когда с устройства приходят сырые MEMS данные.

``NeiryDelegate/onEEGData(samples:)`` - метод вызывается когда с устройства приходят сырые EEG данные.

``NeiryDelegate/onPPGData(samples:)`` - метод вызывается когда с устройства приходят сырые PPG данные.

``NeiryDelegate/onBattery(_:)`` - метод вызывается при изменении заряда батареи.
