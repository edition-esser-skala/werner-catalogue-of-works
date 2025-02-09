\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagiose"
    R1*5
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagiose"
    R1*5
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Adagiose"
    R1*5
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Adagiose"
    R1
    r8 d' f as g4. f16 es
    f8 d f4. es16 d es8 f
    g as b c f,4 es~
    es8 d16 c d4. c16 d es8 d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Adagiose"
    r8 c es g~ g d'4 c8~
    c h16 a! h8 d4 c16 h c4~
    c8 h16 a! h4 c4. d8
    es f g f16 es d8 es16 f b,8 as16 g
    f4. g16 f es8. f16 g f g8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagiose"
    R1*2
    d'4^\tutti f4. es16[ d] es8[ d16 c]
    b4. c8 d4 es~
    es8[ d16 c] d4. c16[ d] es8[ d]
  }
}

SopranoLyrics = \lyricmode {
  San -- _ _ _
  _ ctus, san -- _
  _ _ \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagiose"
    R1
    d4^\tutti as' g4. f16([ es)]
    f8 as4 g16[ f] g4 c,8[ d]
    es[ f g a!] b[ as] g[ f16 es]
    f4. g16[ f] es8.[ f16] g4
  }
}

AltoLyrics = \lyricmode {
  San -- _ _ ctus,
  san -- _ _ ctus, san --
  _ _ _
  _ _ _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagiose"
    r4 es^\tutti d4. c8~
    c[ h16 a!] h8 d4 c16[ h] c4~
    c8[ h16 a!] h4 c r
    g8[ as] b[ c] d[ c] b4
    b g2 g4
  }
}

TenoreLyrics = \lyricmode {
  San -- _ _
  _ _ ctus, san --
  _ ctus,
  san -- ctus, san -- ctus,
  san -- _ ctus,
}

Basso = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagiose"
    c2^\tutti h4 as'
    g f es4. d16[ c]
    d2 c4 c'8[ b!16 as]
    g8[ f] es[ d16 c] b2~
    b4 h c8 c'4 b8
  }
}

BassoLyrics = \lyricmode {
  San -- ctus, san --
  _ ctus, san -- _
  _ ctus, san --
  _ _ _
  ctus, san -- _ \hy
}

Organo = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Adagiose"
    c2-\tutti h4 as'
    g f es4. d16 c
    d2 c4 c'8 b!16 as
    g8 f es d16 c b2~
    b4 h c4. b8
  }
}

BassFigures = \figuremode {
  <_->2. <4>8 <3>
  <5 4>4 <4! _-> <7> <6>
  <7> <6!> <4> <3>
  <6>4. <5!>16 <\t> <5 3>4 <6 4>
  <5 \t> <6 5> <9> <8>
}

\score {
  <<
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
        \set Staff.instrumentName = "b"
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
