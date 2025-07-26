\version "2.24.2"
\include "header.ly"

CornoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    R1*2
    c8. c32 c e16 c g' e \tuplet 3/2 8 { \sbOn c16 c c e e e g g g c c c \sbOff }
    g16. g64 g g16 g g g g g g,4 r
    R1
    e'8. e32 e e16 e e e e e e e e e32 e e16 e
  }
}

CornoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    R1*2
    c8. c32 c e16 c g' e \tuplet 3/2 8 { \sbOn c16 c c e e e g g g c c c \sbOff }
    g16. g64 g g16 g g g g g g,4 r
    R1
    e'8. e32 e e16 e e e e e e e e e32 e e16 e
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    r8 e'16 f g a h8 c8. h16 a h c8
    h16 c d8 c e, d4. g8
    e4 r r2
    R1
    r16 h' gis a h8 \hA gis e \hA gis a16( \hA gis) a8
    gis4 r r2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Largo"
    r8 c'16 d e f g8 e16 f g8 c,16 d e8
    d8.\trill e32 f g8 c4 h16 a h4\trill
    c r r2
    r r8 g, h d
    e4. e8 c h c16( h) c8
    h4 r r2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c'4.^\tutti h8 c4. e8
    d4 c4. h16[ a] h4\trill
    c r r2
    r r8 g[ h d]
    e4 h c8[ h] c4
    h r r2
  }
}

SopranoLyrics = \lyricmode {
  San -- ctus, san -- ctus,
  san -- _ _ _
  ctus,
  san --
  _ ctus, san -- _
  ctus,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    g'4^\tutti g e8[ g] a[ g]
    g4. g8 g2
    g4 r r2
    R1
    r8 gis[ e] \hA gis a[ \hA gis] a4
    gis r r2
  }
}

AltoLyrics = \lyricmode {
  San -- ctus, san -- ctus,
  san -- ctus, san --
  ctus,

  san -- ctus, san -- _
  ctus,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    e4.^\tutti d8 c4 c
    h16[ a h8] c16[ d e8] d2
    e4 r r2
    R1
    r8 h4 e8 e2
    e4 r r2
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus, san -- ctus,
  san -- _ _
  ctus,

  san -- ctus, san --
  ctus,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c'4.^\tutti g8 a[ e f] c
    g[ g'] e[ c] g2
    c4 r r2
    R1
    r8 e[ gis] e a[ e c a]
    e'4 r r2
  }
}

BassoLyrics = \lyricmode {
  San -- _ _ ctus,
  san -- ctus, san --
  ctus,

  san -- ctus, san --
  ctus,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Largo"
    c'4.-\tutti g8 a e f c
    g g' e c g2
    c4 r r2
    R1
    r8 e gis e a e c a
    e'4 r8 \mvTr e\p-\tasto a e c a
  }
}

BassFigures = \figuremode {
  r1
  r2 <4>4 <3>
  r1
  r
  r
  <_+>
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "cor" "1, 2" }
        \partCombine #'(0 . 10) \CornoI \CornoII
      >>
    >>
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
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
