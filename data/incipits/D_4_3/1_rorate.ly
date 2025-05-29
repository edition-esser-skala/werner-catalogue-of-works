\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key d \minor \time 6/4
      \once \omit Staff.TimeSignature
    s4*6
    \time 4/2 \tempoMarkup "Alla breve"
      \set Staff.timeSignatureFraction = 2/2
      a'1 b2 gis
    a4 g f e d2 r
    r a' d4 cis d2
    cis1 r2 a
    d cis f4 e d c
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key d \minor \time 6/4
      \once \omit Staff.TimeSignature
    s4*6
    \time 4/2 \tempoMarkup "Alla breve"
      \set Staff.timeSignatureFraction = 2/2
      r2 d1 e2
    cis d2. c4 h2
    a r d4 e f g
    a2 a4 g f g f e
    d2 r r1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 6/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    s4*6
    \time 4/2 \tempoMarkup "Alla breve"
      \set Staff.timeSignatureFraction = 2/2
      a'1 b2 gis
    a4 g f e d2 r
    r a' d4 cis d2
    cis1 r2 a
    d cis f4 e d c
  }
}

SopranoLyrics = \lyricmode {
  Coe -- _ li
  de -- _ su -- _ per,
  de -- _ _ su --
  per, et
  nu -- bes plu -- _ ant _
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 6/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    s4*6
    \time 4/2 \tempoMarkup "Alla breve"
      \set Staff.timeSignatureFraction = 2/2
      r2 d1 e2
    cis d2. c4 h2
    a r d4 e f g
    a2 a4 g f g f e
    d2 r r1
  }
}

AltoLyrics = \lyricmode {
  Coe -- _
  li de -- _ su --
  per, de -- _ su -- _
  per, de -- _ _ _ su -- _
  per,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 6/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    s4*6
    \time 4/2 \tempoMarkup "Alla breve"
      \set Staff.timeSignatureFraction = 2/2
      R\breve
    a1 b2 gis
    a4 g f e f g a b
    e,2 a d cis
    f e d fis,
  }
}

TenoreLyrics = \lyricmode {
  Coe -- _ li,
  coe -- _ li __ _ de -- _ su -- _
  per, et nu -- bes
  plu -- ant, plu -- ant
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 6/4 \autoBeamOff
      \once \omit Staff.TimeSignature
    c\breve*1/8 d d a' b a \bar "||"
    \time 4/2 \tempoMarkup "Alla breve"
      \set Staff.timeSignatureFraction = 2/2
      R\breve
    r2 d,1 e2
    cis d4 c b2. b4
    a1 r
    r r2 d
  }
}

BassoLyrics = \lyricmode {
  Ro -- _ ra -- _ _ te

  coe -- li,
  coe -- li __ _ de -- su --
  per,
  et
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 6/4
      \once \omit Staff.TimeSignature
    c\breve*1/8 d d a' b a \bar "||"
    \clef soprano \time 4/2 \tempoMarkup "Alla breve"
      \set Staff.timeSignatureFraction = 2/2
      << { a'1 b2 gis } \\ { r d1 e2 } >>
    \clef tenor a, \clef bass d,1 e2
    cis d4 c b!1
    a2 \clef tenor a' d cis
    f e d \clef bass d,
  }
}

BassFigures = \figuremode {
  s4*6
  r\breve
  <_+>2 <5> <6-> <_+>
  <6>1 <5>2. <6>4
  <_+>2 q1 <6>2
  q <6\\> <8 _!> <_+>
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
