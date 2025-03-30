\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key g \minor \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    b'1 c2 d
    es1 d2 b
    c1 b
    c2 a g1
    c c~
    c2 d b g
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key g \minor \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    r1 f
    g2 a b1
    a d,2 g~
    g fis g1
    fis2 g a \hA fis
    g a g1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \minor \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    b'1 c2 d
    es1 d2 b
    c1 b
    c2 a g1
    c c~
    c2 d b g
  }
}

SopranoLyricsA = \lyricmode {
  Ve -- xil -- _
  la re -- _
  gis pro -- _
  de -- unt
  ful -- get __
  cru -- _ cis __
}

SopranoLyricsB = \lyricmode {
  Quae vul -- _
  ne -- ra -- _
  ta lan -- _
  ce -- ae
  mu -- cro --
  ne di -- \hy
}

SopranoLyricsC = \lyricmode {
  Te fons _
  sa -- lu -- _
  tis tri -- _
  ni -- tas
  col -- lau --
  det o -- \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key g \minor \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    r1 f
    g2 a b1
    a d,2 g~
    g fis g1
    fis2 g a \hA fis
    g a g1
  }
}

AltoLyricsA = \lyricmode {
  Ve --
  xil -- _ la
  re -- gis pro --
  de -- unt
  ful -- get cru -- _
  cis, ___  "ful -"
}

AltoLyricsB = \lyricmode {
  Quae
  vul -- _ ne --
  ra -- ta lan --
  ce -- ae
  mu -- _ cro -- _
  ne __ _ "di -"
}

AltoLyricsC = \lyricmode {
  Te
  fons _ sa --
  lu -- tis tri --
  ni -- tas
  col -- _ lau -- _
  det __ _ "o -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    c1 b2 g
    a1 g
    es'2 d d1
    r d
    c2 a b1
  }
}

TenoreLyricsA = \lyricmode {
  Ve -- xil -- la
  re -- gis
  pro -- de -- unt
  ful --
  get cru -- cis
}

TenoreLyricsB = \lyricmode {
  Quae vul -- ne --
  ra -- ta
  lan -- ce -- ae
  mu --
  cro -- ne "di -"
}

TenoreLyricsC = \lyricmode {
  Te fons sa --
  lu -- tis
  tri -- ni -- tas
  col --
  lau -- det "o -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \minor \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    g'1 a2 f
    c1 g'~
    g2 fis g es
    c d g, b'
    a g fis d
    e fis g es
  }
}

BassoLyricsA = \lyricmode {
  Ve -- xil -- la
  re -- _
  _ gis __ _
  pro -- de -- unt ful --
  get cru -- cis, __ _
  cru -- _ cis __ _
}

BassoLyricsB = \lyricmode {
  Quae vul -- ne --
  ra -- _
  _ ta __ _
  lan -- ce -- ae mu --
  cro -- ne di -- _
  ro, __ _ di -- \hy
}

BassoLyricsC = \lyricmode {
  Te fons sa --
  lu -- _
  _ tis __ _
  tri -- ni -- tas col --
  lau -- det o -- _
  mnis, __ _ o -- \hy
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    g2 g' a f
    c1 g'~
    g2 fis g es
    c d g, b'
    a g fis d
    e fis g es
  }
}

BassFigures = \figuremode {
  r1 <6>2 q
  <5> <6>1.
  <4 2>2 <6 5>1.
  <6 5>2 <_+>1 <6>2
  <6\\> <8 4> <3 5> <\t \t>
  <6> q1.
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
    \new ChoirStaff \with { \setGroupDistance #15 #15 } <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyricsA
      \new Lyrics \lyricsto Soprano \SopranoLyricsB
      \new Lyrics \lyricsto Soprano \SopranoLyricsC

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyricsA
      \new Lyrics \lyricsto Alto \AltoLyricsB
      \new Lyrics \lyricsto Alto \AltoLyricsC

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyricsA
      \new Lyrics \lyricsto Tenore \TenoreLyricsB
      \new Lyrics \lyricsto Tenore \TenoreLyricsC

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyricsA
      \new Lyrics \lyricsto Basso \BassoLyricsB
      \new Lyrics \lyricsto Basso \BassoLyricsC
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
