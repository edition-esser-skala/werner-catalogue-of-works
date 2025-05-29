\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key f \major \time 5/4
      \once \omit Staff.TimeSignature
    s4*5 \bar "||"
    \time 3/2 \tempoMarkup "[no tempo]" r2 r c'
    d4 f2 e4 f8 g f e
    d4. d8 c2 r4 c
    d d h2 c
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key f \major \time 5/4
      \once \omit Staff.TimeSignature
    s4*5 \bar "||"
    \time 3/2 \tempoMarkup "[no tempo]" f2 g4 b2 a4
    b8 c b a g4. g8 f2
    r r4 g a a
    r f g g e2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 5/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    s4*5 \bar "||"
    \time 3/2 \tempoMarkup "[no tempo]" r2 r c'
    d4 f2 e4 f8[ g f e]
    d4. d8 c2 r4 c
    d d h2 c
  }
}

SopranoLyrics = \lyricmode {
  Coe --
  li, coe -- li de --
  _ su -- per, et
  nu -- bes plu -- ant
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 5/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    s4*5 \bar "||"
    \time 3/2 \tempoMarkup "[no tempo]" f2 g4 b2 a4
    b8[ c b a] g4. g8 f2
    r r4 g a a
    r f g g e2
  }
}

AltoLyrics = \lyricmode {
  Coe -- li, coe -- li
  de -- _ su -- per,
  et nu -- bes,
  et nu -- bes "plu -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 5/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    s4*5 \bar "||"
    \time 3/2 \tempoMarkup "[no tempo]" R1.
    r2 r4 c d d
    h2 c4 c2 a4
    r2 r r4 c
  }
}

TenoreLyrics = \lyricmode {
  Et nu -- bes
  plu -- ant iu -- stum,
  et
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 5/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    c\breve*1/8 d a' b a \bar "||"
    \time 3/2 \tempoMarkup "[no tempo]" R1.
    r2 r r4 f
    g g e2 f
    r r4 g a a
  }
}

BassoLyrics = \lyricmode {
  Ro -- _ ra -- _ te

  et
  nu -- bes plu -- ant,
  et nu -- bes
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 5/4
      \once \omit Staff.TimeSignature
    c\breve*1/8 d a' b a \bar "||"
    \clef soprano \time 3/2 \tempoMarkup "[no tempo]" << {
      r2 r c'
      d4 f2 e4 f
    } \\ {
      f,2 g4 b2 a4
      b8 c b a \voiceThree g2 f4
    } \\ {
      \voiceTwo s1.
      s2 r4 c d
    } >> \clef bass f,
    g g e2 f
    \clef soprano << { d''4 d h } \\ { r f g } >> \clef bass g, a a
  }
}

BassFigures = \figuremode {
  r4*5
  r1.
  r1 r4 <6>
  <_!>2 <6>1
  r2. <_!>4 <5>2
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
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
