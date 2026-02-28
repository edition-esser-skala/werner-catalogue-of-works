\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Tempo ordinario"
    r8 e16 e e8 e r g16 g g8 g
    r c16 c c8.\trill d16 e8 g e8.\trill e16
    d4 r r2
    R1*2
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Tempo ordinario"
    r8 c16 c c8 c r e16 e e8 e
    r g16 g g8 g g d' c8.\trill c16
    g4 r r2
    R1*2
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Tempo ordinario"
    c4 r8 c16 c c8 c r c16 c
    c8 c r c16 g c8 g c8. c32 c
    g4 r r2
    R1*2
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Tempo ordinario"
    r16 e g c e c g e r g c e g e c g
    r c e g c g e d e g d g e g8 c16
    h d g, h d, g h, d r gis,\p h e gis e h \hA gis
    r a c e f a d, f r g, h d e g c, e
    r f, a c f a d, f e8 a, r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Tempo ordinario"
    r16 c e g c g e c r e g c e c g e
    r e g c e c g e c8 g'~ g16 c8 e16
    d h' g d h d g, h r e,\p gis h e h \hA gis e
    r4 r16 d f a h d g, h r c, e g
    a c f, a r d, f a c4 r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    c'4^\tutti c e e
    g g e8 d e4
    d r r8 h h h
    c4 d h c
    a4. d8 c c4 e8
  }
}

SopranoLyrics = \lyricmode {
  San -- ctus, san -- ctus,
  san -- ctus, san -- ctus, san --
  ctus Do -- mi -- nus
  De -- us, De -- us
  Sa -- ba -- oth, De -- us,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    e4^\tutti e g g
    g8 c4 g8 g2
    g4 r r8 gis gis gis
    a4 f8 d4 g8 e4
    c f e e8 g
  }
}

AltoLyrics = \lyricmode {
  San -- ctus, san -- ctus,
  san -- _ ctus, san --
  ctus Do -- mi -- nus
  De -- us, De -- _ us
  Sa -- ba -- oth, De -- us
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    g4^\tutti g c c
    e4. e16[ d] c8 d c4
    h r e e,8 e
    a4 d, g c,
    f d a' r
  }
}

TenoreLyrics = \lyricmode {
  San -- ctus, san -- ctus,
  san -- ctus, san -- ctus, san --
  ctus Do -- mi -- nus
  De -- us, De -- us
  Sa -- ba -- oth,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    c2^\tutti c
    c4. e16[ g] c8 h c[ c,]
    g'4 r r2
    R1*2
  }
}

BassoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus, san -- ctus, san --
  ctus,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Tempo ordinario"
    c4-\tutti r16 c e g c g e c r c e g
    c g e c r c e g c8 h c16 g e c
    g'4 r \clef tenor e' e,
    a d, g c,
    f d a'4. g8
  }
}

BassFigures = \figuremode {
  r1
  r
  r2 <_+>
  r1
  r
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { \transposedNameShort "clno" "C" "" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new Staff {
      \set Staff.instrumentName = \transposedTimpShort "C" "" "G" ""
      \Timpani
    }
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
}
