import '../Model/Model.dart';
import '../Model/controllers.dart';

class AIRecommendationService {
  static List<Model> getRecommendedProfessionals({int count = 5}) {
    List<Model> recommended = [];

    final allProfessionals = [
      ...ElectricianController().professionals,
      ...PlumberController().professionals,
      ...ACController().professionals,
      ...MechanicController().professionals,
      ...CleaningController().professionals,
      ...PainterController().professionals,
      ...CarpenterController().professionals,
      ...ApplianceController().professionals,
    ];

    final uniqueProfessionals = <String, Model>{};
    for (var pro in allProfessionals) {
      uniqueProfessionals[pro.id] = pro;
    }

    List<Model> uniqueList = uniqueProfessionals.values.toList();

    uniqueList.shuffle();

    for (int i = 0; i < count && i < uniqueList.length; i++) {
      recommended.add(uniqueList[i]);
    }

    if (recommended.length < count) {
      _addProfessionals(recommended, ElectricianController().professionals, count);
      _addProfessionals(recommended, PlumberController().professionals, count);
      _addProfessionals(recommended, ACController().professionals, count);
      _addProfessionals(recommended, MechanicController().professionals, count);
      _addProfessionals(recommended, CleaningController().professionals, count);
      _addProfessionals(recommended, PainterController().professionals, count);
      _addProfessionals(recommended, CarpenterController().professionals, count);
      _addProfessionals(recommended, ApplianceController().professionals, count);
    }

    return recommended.take(count).toList();
  }

  static void _addProfessionals(List<Model> list, List<Model> source, int maxCount) {
    if (list.length >= maxCount) return;

    Set<String> existingIds = list.map((e) => e.id).toSet();

    for (var pro in source) {
      if (list.length >= maxCount) break;
      if (!existingIds.contains(pro.id)) {
        list.add(pro);
        existingIds.add(pro.id);
      }
    }
  }

  static List<Model> getSmartRecommendations({int count = 5}) {
    List<Model> allProfessionals = [];

    allProfessionals.addAll(ElectricianController().professionals);
    allProfessionals.addAll(PlumberController().professionals);
    allProfessionals.addAll(ACController().professionals);
    allProfessionals.addAll(MechanicController().professionals);
    allProfessionals.addAll(CleaningController().professionals);
    allProfessionals.addAll(PainterController().professionals);
    allProfessionals.addAll(CarpenterController().professionals);
    allProfessionals.addAll(ApplianceController().professionals);

    final uniqueProfessionals = <String, Model>{};
    for (var pro in allProfessionals) {
      uniqueProfessionals[pro.id] = pro;
    }

    List<Model> uniqueList = uniqueProfessionals.values.toList();

    uniqueList.sort((a, b) {
      double ratingA = double.tryParse(a.rating ?? '0') ?? 0;
      double ratingB = double.tryParse(b.rating ?? '0') ?? 0;
      return ratingB.compareTo(ratingA);
    });

    return uniqueList.take(count).toList();
  }
}