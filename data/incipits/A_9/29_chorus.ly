\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r16 c'32 d e16 d e g d g e c,32 d e16 d e g d g
    e c'32 d e16 d e g d g e g c a d a h g
    fis d \hA fis a d a \hA fis d r d gis h c, e a c
    h gis e h e h gis e c' a c e a c, h g'
    a, d, fis a d d, g h e, fis32 g a h c16 \hA fis, g32 a h c d16
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r16 e32 f g8~ g h c16 e,32 f g8~ g h
    c,16 e32 f g8~ g h c16 e8 c16 a d8 h16
    a fis a d fis d a fis gis h8 d16 e, c'8 e16
    e, e' h gis h \hA gis e h' e, c a c' d a g h
    fis d \hA fis a d d, g h e, fis32 g a h c16 \hA fis, g32 a h c d16
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r4 r8 h' c8. c16 c8 d
    e8. e16 e8 d e e d d
    d8. d16 d8 d d d c c
    h8. h16 h8 h c c c h
    a8. a16 a8 g g a a h
  }
}

SopranoLyrics = \lyricmode {
  Je -- ru -- ſa -- lem! wie
  wun -- der -- ſchön ſeyn al -- le dei -- ne
  Woh -- nun -- gen. Ô kla -- rer Tag der
  E -- wig -- kheit, den uns der Schö -- pffer
  zue -- be -- reith, kein Fin -- ſter dir, kein
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r4 r8 g' g8. g16 g8 g
    g8. g16 g8 g g e a g
    fis8. fis16 fis8 fis gis gis a a
    h8. h16 h8 gis e a a g
    fis8. fis16 fis8 d e4 fis8 fis
  }
}

AltoLyrics = \lyricmode {
  Je -- ru -- ſa -- lem! wie
  wun -- der -- ſchön ſeyn al -- le dei -- ne
  Woh -- nun -- gen. Ô kla -- rer Tag der
  E -- wig -- kheit, den uns der Schö -- pffer
  zue -- be -- reith, kein Fin -- ſter, kein
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r4 r8 d e8. e16 e8 h
    c8. c16 c8 h c c c h
    a8. a16 a8 a h h c c
    e8. e16 e8 e e e d d
    d8. d16 d8 d c4 a8 d
  }
}

TenoreLyrics = \lyricmode {
  Je -- ru -- ſa -- lem! wie
  wun -- der -- ſchön ſeyn al -- le dei -- ne
  Woh -- nun -- gen. Ô kla -- rer Tag der
  E -- wig -- kheit, den uns der Schö -- pffer
  zue -- be -- reith, kein Fin -- ſter, kein
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r4 r8 g' c8. c16 c8 g
    c,8. c16 c8 g' c a fis g
    d8. d16 d8 c' h h a a
    gis8. gis16 gis8 gis a a fis g
    d8. d16 d8 h c4 d8 d
  }
}

BassoLyrics = \lyricmode {
  Je -- ru -- ſa -- lem! wie
  wun -- der -- ſchön ſeyn al -- le dei -- ne
  Woh -- nun -- gen. Ô kla -- rer Tag der
  E -- wig -- kheit, den uns der Schö -- pffer
  zue -- be -- reith, kein Fin -- ſter, kein
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8 c'16 h c8 g c, c'16 h c8 g
    c, c'16 h c8 g c, a' fis g
    d d'4 c8 h h a a
    gis gis gis gis a a fis g
    d, d' d h c4 d
  }
}

BassFigures = \figuremode {
  r1
  r2. <6>4
  <_+>4. <\t>8 <6\\>2
  r2. <6 5>4
  <_+>4. <6>8 <5> <6> <5 _+> <6 \t>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
