\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key e \minor \time 3/2 \tempoMarkup "[no tempo]"
    r4 h' e dis e h
    r h\p e dis e h
    r h\f g'4. fis8 e2
    r4 e d!2. d4
    d d h d e h
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key e \minor \time 3/2 \tempoMarkup "[no tempo]"
    r2 r4 fis g fis
    g dis r fis\p g fis
    g dis r2 r4 e\f
    c'4. h8 a4 g2 fis4
    g2 r4 g g gis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key e \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    r4 h' e dis e h
    r h\p e dis e h
    r h\f g'4. fis8 e2
    r4 e d!1
    d4 d h d e h
  }
}

SopranoLyricsA = \lyricmode {
  I -- ste con -- fes -- sor,
  i -- ste con -- fes -- sor
  Do -- _ mi -- ni
  co -- len --
  tes, quem pi -- e lau -- dant,
}

SopranoLyricsB = \lyricmode {
  Qui pi -- us pru -- dens,
  qui pi -- us pru -- dens
  et hu -- mi -- lis,
  pu -- di --
  cus, so -- bri -- am du -- xit,
}

SopranoLyricsC = \lyricmode {
  Sit sa -- lus il -- li,
  sit sa -- lus il -- li,
  de -- _ _ cus
  et vir --
  tus, qui su -- pra coe -- li,
}

Alto = {
  \relative c' {
    \clef alto
    \key e \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 r4 fis g fis
    g dis r fis\p g fis
    g dis r2 r4 e\f
    c'4. h8 a4 g g fis
    g2 r4 g g gis
  }
}

AltoLyricsA = \lyricmode {
  I -- ste con --
  fes -- sor, i -- ste con --
  fes -- sor Do --
  _ mi -- ni co -- len -- _
  tes, quem pi -- e
}

AltoLyricsB = \lyricmode {
  Qui pi -- us
  pru -- dens, qui pi -- us
  pru -- dens et
  hu -- mi -- lis, pu -- di -- _
  cus, so -- bri -- am
}

AltoLyricsC = \lyricmode {
  Sit sa -- lus
  il -- li, sit sa -- lus
  il -- li, de --
  _ _ cus et vir -- _
  tus, qui su -- pra
}

Tenore = {
  \relative c' {
    \clef tenor
    \key e \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 r4 h h h
    h h r h\p h h
    h h r2 g4\f e'~
    e8 d c2 h4 a2
    h r4 h c h
  }
}

TenoreLyricsA = \lyricmode {
  I -- ste con --
  fes -- sor, i -- ste con --
  fes -- sor Do -- _
  mi -- ni co -- len --
  tes, quem pi -- e
}

TenoreLyricsB = \lyricmode {
  Qui pi -- us
  pru -- dens, qui pi -- us
  pru -- dens et hu --
  mi -- lis, pu -- di --
  cus, so -- bri -- am
}

TenoreLyricsC = \lyricmode {
  Sit sa -- lus
  il -- li, sit sa -- lus
  il -- li, de -- _
  cus at -- que vir --
  tus, qui su -- pra
}

Basso = {
  \relative c {
    \clef bass
    \key e \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 r4 h' g dis
    e h r fis'\p e dis
    e h r e\f c'4. h8
    a4. g8 fis4 g d2
    g, r4 g' c, e
  }
}

BassoLyricsA = \lyricmode {
  I -- ste con --
  fes -- sor, i -- ste con --
  fes -- sor Do -- _ mi --
  ni __ _ _ co -- len --
  tes, quem pi -- e
}

BassoLyricsB = \lyricmode {
  Qui pi -- us
  pru -- dens, qui pi -- us
  pru -- dens et hu -- _
  _ mi -- lis, pu -- di --
  cus, so -- bri -- am
}

BassoLyricsC = \lyricmode {
  Sit sa -- lus
  il -- li, sit sa -- lus
  il -- li, de -- _ _
  _ cus at -- que vir --
  tus, qui su -- pra
}

Organo = {
  \relative c {
    \clef bass
    \key e \minor \time 3/2 \tempoMarkup "[no tempo]"
    e4. fis8 g a h4 g dis
    e << { h'8 a } \\ { h,4\p } >> g' fis e dis
    e h r e\f c'4. h8
    a4. g8 fis4 g d2
    g, r4 g' c, e
  }
}

BassFigures = \figuremode {
  r2. <_+>4 <6>2
  r4 <_+> <6> <6\\>2 <[6]>4
  r <_+> r1
  r2 <6 5> <4>4 <3>
  r1 r4 <_+>
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
    \new ChoirStaff \with { \setGroupDistance #16 #16 } <<
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
