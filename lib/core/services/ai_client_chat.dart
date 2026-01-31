// import 'package:injectable/injectable.dart';
// import 'package:signals/signals_flutter.dart';
// import 'package:vitalingu/core/models/ai_client.dart';
// import 'package:vitalingu/core/models/chat_conversation.dart';


// class ReadOnlyComputedSignal<T> extends Computed<T> {
//   final Signal<T> mySignal;

//   T get signalValue {
//     return mySignal.value;
//   }
  
//   ReadOnlyComputedSignal(this.mySignal) : super(() {
//     mySignal.value;
//     return mySignal.value;
//   });
  
//   @override
//   void dispose() {
//     mySignal.dispose();
//     super.dispose();
//   }
// }


// @injectable
// class AiClientChat extends ReadOnlyComputedSignal<ChatConversation> {
//   final AiClient aiClient;
//   final String? systemInstruction;
  
//   AiClientChat(super.mySignal,this.aiClient, this.systemInstruction);
  
//   @factoryMethod 
//   static AiClientChat create(
//     AiClient aiClient,
//     @factoryParam String? systemInstruction,
//   ) {
//     final conversationSignal = signal<ChatConversation>(ChatConversation());
//     return AiClientChat(conversationSignal, aiClient, systemInstruction);
//   }

//   Future<void> addMessage(String message) async
//   {
    
//     mySignal.set(signalValue.addUserMessage(message).copyWith(), force: true);
//     final chat = await aiClient.sendMessageFromConversation(signalValue);
//     mySignal.set(chat.copyWith(), force: true);
//   }



  




// }