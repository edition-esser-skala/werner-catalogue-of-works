\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Adagio"
    es'8 c g c es,4 r
    R1*2
    r4 r8 g c c c d
    es2 d4 r8 des
    c4. c8 c des4 c8
    c4 b c2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Adagio"
    c'8 g es g c,4 r
    R1*4
    r2 r4 r8 c
    f f f g as2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*3
    r4 r8 g' c c c d
    es2 d4 r8 des
    c4. c8 c des4 c8
    c4 b c2
  }
}

SopranoLyrics = \lyricmode {
  Laßt uns dan mit Ver --
  trau -- en zu
  un -- ſern Hey -- _ land
  khe -- _ ren,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*5
    r2 r4 r8 c
    f f f g as2
  }
}

AltoLyrics = \lyricmode {
  Laßt
  uns dan mit Ver -- "trau -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r4 r8 g c c c d
    es2 des
    c8 c f4. e8 es4
    d!4. es16[ d] c2~
    c8[ h] c2 b4~
    b8 b as g \hA as4 g
    f2 e4 r8 f
  }
}

TenoreLyrics = \lyricmode {
  Laßt uns dan mit Ver --
  trau -- _
  en zu un -- _ ſern
  Hey -- land khe --
  _ ren, __
  zu un -- ſern Hey -- land
  khe -- ren, mit
}

Basso = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1
    r4 r8 c f f f g
    as2 g8 g c4~
    c8[ h] b4 as4. g8
    fis2 g8 g g f
    e4. e8 f4 es
    des2 c4 r
  }
}

BassoLyrics = \lyricmode {
  Laßt uns dan mit Ver --
  trau -- en zu un --
  ſern Hey -- land
  khe -- ren, zu un -- ſern
  Hey -- land khe -- _
  _ ren,
}

Continuo = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Adagio"
    c4^\tutti r c r
    r8 c c c f f f g
    as4 r8 \hA as g4 c~
    c8 h b4 as4. g8
    fis2 g4. f8
    e2 f4 es
    des2 c4 f
  }
}

BassFigures = \figuremode {
  r1
  r2 <6->
  r4. <6>8 <7 _!> <6!> <_->4
  <2> <6>2.
  <7- 5>2 <4>4 <_->8 <6->
  <6 5>2 <5>8 <6-> <7> <6>
  <7>4 <6> <6- _!> <_->
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
