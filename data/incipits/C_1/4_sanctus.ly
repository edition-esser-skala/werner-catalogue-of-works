\version "2.24.2"
\include "header.ly"

TromboneI = {
  \relative c' {
    \clef alto
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    r8 c4-\tutti d8 e f g4~
    g8 f4 es8 d d'4 c8
    b2~ b8 as4 g8
    fis g16 a g8 fis g4. a8
    g4 fis g r
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    es4.-\tutti d8 c d e16 d e8
    f4 c r8 a! fis d
    r g d'4 g,8 c4 b8
    a16 g a8 b c d4 g,8 es'
    d2 d4 r
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    g'4-\tutti c2 b4
    as g8 a16 g fis8 fis4 g16 a
    g a b8~ b16 c d8 es4. es8
    d4. c8 b4. c8
    b a16 g a4\trill g8 g g g
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    g'4-\tutti c2 b4
    as g8 a16 g fis8 fis4 g16 a
    g a b8~ b16 c d8 es4. es8
    d4. c8 b4. c8
    b a16 g a4\trill g8 g g g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    g'4^\tutti c2 b4
    as g8[ a16 g] fis8 fis4 g16[ a]
    g[ a b8]~ b16[ c d8] es4. es8
    d4. c8 b4. c8
    b[ a16 g] a4\trill g8 g g g
  }
}

SopranoLyrics = \lyricmode {
  San -- _ _
  _ _ ctus, san -- _
  _ _ ctus,
  san -- _ _ _
  _ _ ctus Do -- mi -- nus
}

Alto = {
  \relative c' {
    \clef alto
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    r8 c4^\tutti d8 e[ f] g4~
    g8 f4 es8 d d'4 c8
    b2~ b8 as4 g8
    fis[ g16 a] g8[ fis] g4. a8
    g4 fis g r
  }
}

AltoLyrics = \lyricmode {
  San -- _ _ _
  _ _ ctus, san -- _
  _ _ _
  _ _ _ ctus,
  san -- _ ctus
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    es4.^\tutti d8 c[ d] e16[ d e8]
    f4 c r8 a![ fis] d
    r g d'4 g,8 c4 b8
    a16[ g a8] b[ c] d4 g,8[ es']
    d2 d4 r
  }
}

TenoreLyrics = \lyricmode {
  San -- _ _ _
  _ ctus, san -- ctus,
  san --_  ctus, san -- _
  _ _ _ ctus,
  san -- ctus
}

Basso = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    c'2^\tutti c,
    c d
    es4 d c2
    d8[ c b a] g[ g'16 f] es8 c
    d2 g,4 r
  }
}

BassoLyrics = \lyricmode {
  San -- ctus,
  san -- ctus,
  san -- _ ctus,
  san -- _ _ ctus,
  san -- ctus
}

Organo = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Largo"
    c2~-\tutti c~
    c d
    es4 d c2
    d8 c b a g g'16 f es8 c
    d2 g,4 r
  }
}

BassFigures = \figuremode {
  <_->2 <8 _!>4 <7->
  <6- 5>8 <\t 4> <5 \t> <\t _-> <_+>2
  <5>4 <6> <7>8 <6-> <\t> <5>
  <_+>4 <6>8 <6\\>2 <6>8
  <6 4>4 <5 _+>2.
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
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
}
