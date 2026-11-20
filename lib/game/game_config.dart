import 'package:flutter/material.dart';

import '../app/arcade_stage.dart';
import '../app/game_api.dart';
import '../core/game_rules.dart';
import 'rally_engine.dart';
import 'rally_view.dart';
import 'rules.dart';

final gameConfig = GameConfig(
  gameId: 'game-090-tennis-clash-mini',
  title: const ['Tenis Düellosu Mini', 'Tennis Clash Mini', 'Tennis-Duell Mini', 'Duelo de Tenis Mini', 'Duel de Tennis Mini'],
  tagline: const ['Fileden geçir, oyunu kazan, maçı al!', 'Over the net, win the game, take the match!', 'Übers Netz zum Sieg!', '¡Por encima de la red!', 'Par-dessus le filet !'],
  seedColor: const Color(0xFF2A9D8F),
  icon: Icons.sports_tennis,
  rules: TennisRules(),
  buildPlay: (ctx) => ArcadeStage(
    ctx: ctx,
    create: () => RallySim((ctx.generated as GeneratedLevel<RallyLevel>).puzzle),
    paint: paintRally,
    sound: rallySound,
    boosterIcon: Icons.flash_on,
    boosterLabel: (l) => l == 'tr' ? 'Süper vuruş' : 'Super shot',
    howTo: const ['Parmağını sürükle: raket parmağının biraz üstünde durur. Top raketin menziline girince otomatik vurulur; topa raketin sağıyla vurursan sağa, soluyla vurursan sola gider. Yukarı kaydır: sert vuruş.', 'Drag your finger: the racket follows just above it. Hits are automatic in reach; meet the ball with the right side to aim right, left side to aim left. Swipe up for a power shot.', 'Finger ziehen: der Schläger folgt. Schläge automatisch, nach oben wischen: harter Schlag.', 'Arrastra el dedo: la raqueta te sigue. Golpe automático; desliza arriba: golpe fuerte.', 'Glissez : la raquette suit. Frappe automatique ; glissez vers le haut : coup puissant.'],
  ),
  tutorial: const [
    TutorialStep(Icons.open_with, ['Oyuncunu topun geleceği yere götür.', 'Move to where the ball will be.', 'Zum Ball laufen.', 'Ve hacia la bola.', 'Allez vers la balle.']),
    TutorialStep(Icons.call_split, ['Açılı vuruşla rakibi koştur.', 'Use angles to make the rival run.', 'Winkel nutzen.', 'Usa los ángulos.', 'Jouez les angles.']),
    TutorialStep(Icons.north, ['Yukarı kaydır: sert vuruş.', 'Swipe up for a power shot.', 'Nach oben: harter Schlag.', 'Arriba: golpe fuerte.', 'Vers le haut : coup fort.']),
  ],
);
