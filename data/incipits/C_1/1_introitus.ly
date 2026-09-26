\version "2.24.2"
\include "header.ly"

TromboneI = {
  \relative c' {
    \clef alto
    \key c \dorian \time 4/4 \tempoMarkup "Adagiose"
    es4-\tutti e f es8 d
    es4 r r8 g as g~
    g f16 e f2 e4
    f as8 g fis4 g
    e f2 es8 d
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 4/4 \tempoMarkup "Adagiose"
    g4-\tutti c h8 d c h
    c4 es8 d c8. b16 as8 b~
    b as16 g as4 b g'
    c,8 b as c d4 g,~
    g8 c4 c8 d4. d8
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Adagiose"
    es'4-\tutti e f es8 d
    es4 r r8 g as g~
    g f16 e f2 e4
    f as8 g fis4 g
    e f2 es8 d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Adagiose"
    c'4.-\tutti g8 as4 as
    g8 g c d es4 d
    c4. c8 b16 c des8 c b
    as b c2 b4~
    b as2 g8 f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagiose"
    c'4.^\tutti g8 as4 as
    g8 g c[ d] es4 d
    c4. c8 b16[ c des8] c[ b]
    as[ b] c2 b4~
    b as2 g8[ f]
  }
}

SopranoLyrics = \lyricmode {
  Re -- _ _ qui --
  em ae -- ter -- _ _
  nam, ae -- ter -- _
  nam do -- na __
  e -- i, __
}

Alto = {
  \relative c' {
    \clef alto
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagiose"
    es4^\tutti e f es8[ d]
    es4 r r8 g as[ g]~
    g[ f16 e] f2 e4
    f as8 g fis4 g
    e f2 es8[ d]
  }
}

AltoLyrics = \lyricmode {
  Re -- _ _ qui --
  em ae -- ter --
  _ _
  nam do -- na e -- i,
  do -- _ na
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagiose"
    g4^\tutti c h8[ d] c[ h]
    c4 es8[ d] c8.[ b16] as8[ b]~
    b[ as16 g] as4 b g'
    c,8[ b] as c d4 g,~
    g8 c4 c8 d4. d8
  }
}

TenoreLyrics = \lyricmode {
  Re -- _ _ qui --
  em ae -- ter -- _
  _ _ _
  nam do -- na e -- i, __
  e -- i, Do -- "mi -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagiose"
    c2.^\tutti c4
    c r r8 c f[ g]
    as2 g
    f4. es!8 d4 es
    c f h,2
  }
}

BassoLyrics = \lyricmode {
  Re -- qui --
  em ae -- ter --
  _ nam
  do -- na, do -- na
  e -- i, "Do -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Adagiose"
    c2~-\tutti c~
    c4 r r8 c f g
    as2 g
    f4. es!8 d!4 es
    c f h,2
  }
}

BassFigures = \figuremode {
  <5 _->4 <8 _!> <7! 6- 4>2
  <8 _->2. <6 _->4
  <9 7> <8 6> <7 _-> <6! \t>
  <_->4. <3>8 <7 _+>4 <5>
  <7 _!> <_-> <7> <6>8 <5>
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
