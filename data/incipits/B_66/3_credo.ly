\version "2.24.2"
\include "header.ly"

TromboneI = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/2 \tempoMarkup "Adagio"
    R1.*5
    f2.-\tutti e4 a2~
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key d \minor \time 3/2 \tempoMarkup "Adagio"
    R1.*5
    r2 c2.-\tutti f,4
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/2 \tempoMarkup "Adagio"
    R1.*6
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/2 \tempoMarkup "Adagio"
    R1.*6
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 3/2 \autoBeamOff \tempoMarkup "Adagio"
    d4^\solo d'8 d c4 a b2
    a4 f f' e d c8 c
    b2 a4 a b fis
    g g8 g g4. g8 g4 b!~
    b a g f f4. e8
    f2 r r
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, fa -- cto -- rem coe -- li et
  ter -- rae, vi -- _ si --
  bi -- li -- um o -- mni -- um et __
  in -- vi -- si -- bi -- li --
  um.
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/2 \autoBeamOff \tempoMarkup "Adagio"
    R1.*5
    f2.^\tutti e4 a2
  }
}

AltoLyrics = \lyricmode {
  Et in "u -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 3/2 \autoBeamOff \tempoMarkup "Adagio"
    R1.*5
    r2 c2.^\tutti f,4
  }
}

TenoreLyrics = \lyricmode {
  Et in
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 3/2 \autoBeamOff \tempoMarkup "Adagio"
    R1.*6
  }
}

BassoLyrics = \lyricmode {
  %tacet
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/2 \tempoMarkup "Adagio"
    d2-\solo e4 f2 e4
    f2. c4 d a'~
    a g d2 r4 d
    es h c2 g4 g'
    e f c d b c
    f,2 \clef "treble_8" << { f''4 e a2 } \\ { c,2.-\tutti f,4 } >>
  }
}

BassFigures = \figuremode {
  r2. <3>4 <2>2
  r2. r2 <3>4
  <2>2 <_+>2. q4
  r2 <_-> <_!>4 <_->
  <5>1 <6 5>2
  r1.
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
