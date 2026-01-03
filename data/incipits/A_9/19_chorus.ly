\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Adagio[se]"
    r2 g'~
    g8 f f4. es8 d4~
    d c h r
    r8 es' es es c4. c8
    c2 r
    r4 c2 h8 a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Adagio[se]"
    r8 g' g g es4 es
    as8 as as2 g8 f
    es4. es8 d4 b!
    r2 r8 c f g~
    g g f f f4 es
    d r r8 f f f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio[se]"
    r8 g' g g es4 es
    as8 as as2 g8[ f]
    es4. es8 d2
    r8 es' es es c4. c8
    c2 r
    r4 c2 h8 a
  }
}

SopranoLyrics = \lyricmode {
  So iſt dan di -- ſer
  Tag des Jam -- mers
  und der Plag,
  ſo iſt dan di -- ſer
  Tag
  des Jam -- mers
}

Alto = {
  \relative c' {
    \clef alto
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio[se]"
    R1
    r4 c d8 d d4~
    d c h r
    r2 r8 c f g
    g g f2 es4
    d r r8 f f f
  }
}

AltoLyrics = \lyricmode {
  Des Jam -- mers und __
  der Plag,
  ſo iſt dan
  di -- ſer, di -- ſer
  Tag nun würckh -- lich
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio[se]"
    r2 r8 c c c
    as as f2 r4
    r2 r4 b!~
    b as8 g \hA as4. g8
    as2 r8 g g g
    g4. as16[ g] f4 f
  }
}

TenoreLyrics = \lyricmode {
  So iſt dan
  di -- ſer Tag
  des __
  Jam -- mers und der
  Plag nun würckh -- lich
  an -- ge -- ru -- ckhet,
}

Basso = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio[se]"
    R1
    r8 f f f h,4 h
    c4. c8 g4 r
    g'2. f8 e
    f4. f8 c2
    r4 es2 d8 c
  }
}

BassoLyrics = \lyricmode {
  So iſt dan di -- ſer,
  di -- ſer Tag
  des Jam -- mers
  und der Plag
  des Jam -- mers
}

Continuo = {
  \relative c {
    \clef alto
    \key c \dorian \time 4/4 \tempoMarkup "Adagio[se]"
    r8 << { \mvTr g'' g g g2 g8 } \\ { \voiceThree s4. es4 es c8 } \\ { \voiceTwo s4. r8 c c c as } >>
    \clef bass f f f h,2
    c g
    g'2. f8 e
    f2 c
    r4 es2 d8 c
  }
}

BassFigures = \figuremode {
  r1
  r8 <8 _->4. <7->4 <6>8 <5>
  <9>4 <8> <_!> <_->
  <6->2 <4 2->4 <_->8 r
  <9 _->4 <8 \t> <5 4> <\t 3>
  r <6 3> <\t 2> <6!>8 <6>
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
}
