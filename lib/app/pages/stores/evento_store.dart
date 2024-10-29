import 'package:flutter/material.dart';
import 'package:xotecariri/app/data/http/exceptions.dart';
import 'package:xotecariri/app/data/http/http_client.dart';
import 'package:xotecariri/app/data/models/event_model.dart';
import 'package:xotecariri/app/data/repositories/event_repository.dart';

class EventoStore {
  final IEventRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<List<EventModel>> state = ValueNotifier<List<EventModel>>([]);
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  EventoStore({required this.repository, required HttpClient client});

  // Método para obter todos os eventos
  Future<void> getEventos() async {
    isLoading.value = true;
    erro.value = ''; // Limpar erros anteriores

    try {
      final result = await repository.getEventos();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Método para obter eventos recentes
  Future<void> getRecentEventos() async {
    isLoading.value = true;
    erro.value = ''; // Limpar erros anteriores

    try {
      final result = await repository.getRecentEvents();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Método para obter eventos pagos
  Future<void> getPaidEventos() async {
    isLoading.value = true;
    erro.value = ''; // Limpar erros anteriores

    try {
      final result = await repository.getPaidEvents();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Método para obter eventos gratuitos
  Future<void> getFreeEventos() async {
    isLoading.value = true;
    erro.value = ''; // Limpar erros anteriores

    try {
      final result = await repository.getFreeEvents();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Método para obter eventos por tipo
  Future<void> getEventosByType(String eventType) async {
    isLoading.value = true;
    erro.value = ''; // Limpar erros anteriores

    try {
      final result = await repository.getEventsByType(eventType);
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Método para obter eventos por data (asc)
  Future<void> getEventosByDateAsc() async {
    isLoading.value = true;
    erro.value = ''; // Limpar erros anteriores

    try {
      final result = await repository.getEventsByDateAsc();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Método para obter eventos por data (desc)
  Future<void> getEventosByDateDesc() async {
    isLoading.value = true;
    erro.value = ''; // Limpar erros anteriores

    try {
      final result = await repository.getEventsByDateDesc();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
