\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/2 \tempoMarkup "Alla breve"
      \set Staff.timeSignatureFraction = 2/2
    r4 c' h a g e f g
    a h c d e f g e
    f g a h c h a g
    f d8 e f4 g a a2 g8 f
    e4 c e fis g d g2~
    g4 g f g8 f e4 a, a'2~
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/2 \tempoMarkup "Alla breve"
      \set Staff.timeSignatureFraction = 2/2
    r4 a' g f e c d e
    f g a h c d e c
    a h c d e d c2
    h2. h4 a f a h
    c2. c4 h2. cis4
    d a d2. d4 c d8 c
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/2 \tempoMarkup "Alla breve" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    r1 e'
    a,2 a c2. c4
    h2 h a1
    r2 e' h2. cis?4
    d1. c2
  }
}

SopranoLyricsA = \lyricmode {
  O
  sa -- lu -- ta -- ris
  ho -- sti -- a,
  quae coe -- li
  pan -- dis
}

SopranoLyricsB = \lyricmode {
  U --
  ni tri -- no -- que
  Do -- mi -- no
  sit sem -- pi --
  ter -- na
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/2 \tempoMarkup "Alla breve" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    a'1 e2 e
    f1 e
    f2. g4 c,2 a'
    e2. fis4 g1~
    g2 f e a
  }
}

AltoLyricsA = \lyricmode {
  O sa -- lu --
  ta -- ris
  ho -- sti -- a, quae
  coe -- li pan --
  dis o \hy
}

AltoLyricsB = \lyricmode {
  U -- ni tri --
  no -- que
  Do -- mi -- no sit
  sem -- pi -- ter --
  na glo \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/2 \tempoMarkup "Alla breve" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    r1 e
    a,2 a c2. e4
    e2 d c1
    r2 d a2. h4
    c1( d2) g,
    a2. a4 a2 e'
  }
}

TenoreLyricsA = \lyricmode {
  O
  sa -- lu -- ta -- ris
  ho -- sti -- a,
  quae coe -- li
  pan -- dis
  o -- sti -- um, "coe -"
}

TenoreLyricsB = \lyricmode {
  U --
  ni tri -- no -- que
  Do -- mi -- no
  sit sem -- pi --
  ter -- na
  glo -- ri -- a, "sem -"
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/2 \tempoMarkup "Alla breve" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    a'1 e2 e
    f1 c
    d2. d4 a2 a'
    d,2. e4 f1
    c2 a' g e
    d1 a
  }
}

BassoLyricsA = \lyricmode {
  O sa -- lu --
  ta -- ris
  ho -- sti -- a, quae
  coe -- li pan --
  dis, quae coe -- li
  pan -- dis,
}

BassoLyricsB = \lyricmode {
  U -- ni tri --
  no -- que
  Do -- mi -- no sit
  sem -- pi -- ter --
  na, sit sem -- pi --
  ter -- na,
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/2 \tempoMarkup "Alla breve"
      \set Staff.timeSignatureFraction = 2/2
    a'1 << { e' a,2 s } \\ { e2 e f1 } >>
    c
    d a2 a'
    d,2. e4 f1
    c2 a << { g' } \\ { g, } >> e'
    d1 a
  }
}

BassFigures = \figuremode {
  <1>\breve
  r2 <10> <10 5>1
  <9>2 <8>1.
  <6>1 <3>2. <4>4
  r2 <5>4 <6\\>2. <5>4 <6\\>
  <4>2 <3> <4> <3>
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
      \new Lyrics \lyricsto Soprano \SopranoLyricsA
      \new Lyrics \lyricsto Soprano \SopranoLyricsB

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyricsA
      \new Lyrics \lyricsto Alto \AltoLyricsB

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyricsA
      \new Lyrics \lyricsto Tenore \TenoreLyricsB

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyricsA
      \new Lyrics \lyricsto Basso \BassoLyricsB
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
