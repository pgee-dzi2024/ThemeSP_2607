import socket
import re


def send_magic_packet(mac_address, ip_address="255.255.255.255", port=9):
    """
    Генерира и изпраща Wake-on-LAN Magic Packet.

    :param mac_address: MAC адрес на целевия компютър (напр. 00:1A:2B:3C:4D:5E)
    :param ip_address: Broadcast адрес (по подразбиране е глобалният 255.255.255.255)
    :param port: UDP порт (стандартно 7 или 9 за WOL)
    :return: Tuple (bool, str) - (Успех, Съобщение)
    """
    try:
        # 1. Изчистване на MAC адреса от разделители (двоеточия или тирета)
        clean_mac = mac_address.replace(':', '').replace('-', '').upper()

        # Проверка дали след изчистването дължината е точно 12 символа (6 байта)
        if len(clean_mac) != 12:
            return False, "Невалидна дължина на MAC адрес."

        # 2. Създаване на Magic Packet
        # Пакетът се състои от 6 байта 'FF', последвани от 16 повторения на MAC адреса
        payload_hex = ('FF' * 6) + (clean_mac * 16)

        # Конвертиране на шестнайсетичния низ в реални байтове
        packet_data = bytes.fromhex(payload_hex)

        # 3. Създаване на UDP сокет
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

        # Разрешаване на сокета да изпраща broadcast съобщения
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)

        # 4. Изпращане на пакета
        sock.sendto(packet_data, (ip_address, port))
        sock.close()

        return True, "WOL пакетът е изпратен успешно."

    except ValueError:
        return False, "Невалиден формат на MAC адреса (съдържа невалидни символи)."
    except Exception as e:
        return False, f"Възникна системна/мрежова грешка: {str(e)}"
