\version "2.24.2"
\include "header.ly"

Cornetto = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    r4 c' h4. h8
    c4 c2 c8 c
    c4 h a h
    a4. a8 g2\fermata
    \tempoMarkup "Allegro" r8 e' d h e e d c16 h
    e8 e16 e d8 h e e d e
  }
}

TromboneI = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    r4 g' g4. g8
    g4 r a a8 a
    a4 g fis8 d g4~
    g fis g2\fermata
    \tempoMarkup "Allegro" r8 g g g g16 a g a g a g a
    g a g a g a g a g a g a g a g a
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    r4 e d4. d8
    e4 e2 e8 e
    d4 d d2~
    d4. d8 d2\fermata
    \tempoMarkup "Allegro" r8 c d d d c d d16 d
    e8 c16 c d8 d d c h c
  }
}

Fagotto = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    r4 c g' g,
    c r a2
    fis4 g d'2~
    d g,\fermata
    \tempoMarkup "Allegro" r8 c' h g c4 h8 a16 g
    c4 h8 g c4 g8 c
  }
}

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    R1*4 \tempoMarkup "Allegro"
    r8 \pa e' d d \pd e4 d8 g
    e4 d8 d e4 d8 e
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    R1*4 \tempoMarkup "Allegro"
    r8 c' d d c4 g8 d'
    c4 g8 g g4 g8 g
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    R1*4 \tempoMarkup "Allegro"
    r8 c g g c4 g8 g
    c4 g8 g g4 g8 g
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    r4 c' h4. h8
    c4 c2 c4~
    c h a h
    a2 g\fermata
    r8 g g g g16 a g a g a g a
    g a g a g a g a g a g a g a g a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    r4 c' h4. h8
    c4 c2 c4~
    c h a h
    a2 g\fermata
    r8 g g g g16 a g a g a g a
    g a g a g a g a g a g a g a g a
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r4 c'^\tutti h4. h8
    c4 c2 c8 c
    c4 h a( h
    a4.) a8 g2\fermata
    \tempoMarkup "Allegro" r8 e' d h e e d c16 h
    e8 e16 e d8 h e e d e
  }
}

SopranoLyrics = \lyricmode {
  Ma -- gni -- fi --
  cat a -- ni -- ma
  me -- a Do --
  mi -- num,
  et ex -- ul -- ta -- vit spi -- ri -- tus
  me -- us in De -- o sa -- lu -- ta -- ri
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r4 g'^\tutti g4. g8
    g4 r a a8 a
    a4 g fis8[ d] g4~
    g fis g2\fermata
    \tempoMarkup "Allegro" r8 g g g g16[ a g a] g[ a g a]
    g[ a g a] g[ a g a] g[ a g a] g[ a] g[ a]
  }
}

AltoLyrics = \lyricmode {
  Ma -- gni -- fi --
  cat a -- ni -- ma
  me -- a Do -- _
  mi -- num,
  et ex -- ul -- ta -- _
  _ _ _ _ vit
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r4 e^\tutti d4. d8
    e4 e2 e8 e
    d4 d d2~
    d4. d8 d2\fermata
    \tempoMarkup "Allegro" r8 c d d d c d d16 d
    e8 c16 c d8 d d c h c
  }
}

TenoreLyrics = \lyricmode {
  Ma -- gni -- fi --
  cat a -- ni -- ma
  me -- a Do --
  mi -- num,
  et ex -- ul -- ta -- vit spi -- ri -- tus
  me -- us in De -- o sa -- lu -- ta -- ri
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r4 c^\tutti g'4. g8
    c,4 r a a'8 a
    fis4 g d2~
    d4. d8 g,2\fermata
    \tempoMarkup "Allegro" r8 c' h g c c h a16 g
    c8 c,16 c' h8 g c c g c
  }
}

BassoLyrics = \lyricmode {
  Ma -- gni -- fi --
  cat a -- ni -- ma
  me -- a Do --
  mi -- num,
  et ex -- ul -- ta -- vit spi -- ri -- tus
  me -- us in De -- o sa -- lu -- ta -- ri
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    r4 c-\tutti g' g,
    c r a2
    fis4 g d'2~
    d g,\fermata
    \tempoMarkup "Allegro" r8 c' h g c4 h8 a16 g
    c4 h8 g c4 g8 c
  }
}

BassFigures = \figuremode {
  r1
  r
  <6 5>2 <_+>4 <6 4>
  <5 \t> <\t _+>2.
  r1
  r
}

\score {
  <<
    \new StaffGroup <<
      \new Staff \with { \smallStaffDistance } {
        \set Staff.instrumentName = "cnto"
        \Cornetto
      }
      \new GrandStaff \with { \smallGroupDistance } <<
        \set GrandStaff.instrumentName = "trb"
        \new Staff {
          \set Staff.instrumentName = "1"
          \TromboneI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \TromboneII
        }
      >>
      \new Staff {
        \set Staff.instrumentName = "fag"
        \Fagotto
      }
    >>
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "clno" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new Staff {
      \set Staff.instrumentName = "timp"
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
