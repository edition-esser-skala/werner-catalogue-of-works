\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c16 e g c g h d g c, e g c h g d h
    g c e c a d f d h e g e c f a f
    d g h g c g e c' h g d h g4
    R1*2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c16 e g c g h d g c, e g c h g d h
    g c e c a d f d h e g e c f a f
    d g h g c g e c' h g d h g4
    R1*2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 g'8[^\tutti h] c e d d
    c8.[\trill h32 c] d8.[\trill c32 d] e8.[\trill d32 e] f8 f
    d d e4 d8 d^\solo d e
    f d e[ c16 d] e4. d8
    e h c d16 d e8 c4 c8
  }
}

SopranoLyrics = \lyricmode {
  Se -- de a dex -- tris
  me -- _ _ is, a
  dex -- tris me -- is, Vir -- gam vir --
  tu -- tis tu -- _ _
  ae ex u -- te -- ro an -- te "lu -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r8 g'4^\tutti g8 g4 g
    g8 e a f h g16 g c8 a
    g4 g8 g g g r4
    r g8^\solo g c c16 h a8. a16
    gis8 gis a h c8.[ h16] a8 g
  }
}

AltoLyrics = \lyricmode {
  do -- nec po -- nam
  in -- i -- mi -- cos tu -- os, sca -- bel -- lum
  pe -- dum tu -- o -- rum.
  Do -- mi -- na -- re in me -- di --
  o in -- i -- mi -- co -- rum "tu -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    e8^\tutti e d d16 d c8 c16 c h4\trill
    c a8[ d] h e c4
    d c h r
    r2 r8 e^\solo a, f'
    h,8. h16 e8 d c16 d e8 e e
  }
}

TenoreLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus Do -- mi -- no me --
  o: Se -- de a dex -- tris
  me -- is,
  Te -- cum prin --
  ci -- pi -- um in di -- e vir -- tu -- tis
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    c8^\tutti c' h g16 g e8 c16 c g'4
    e8 c[ f] d g[ e] a f
    h[ g] e[ c'] g g r g^\solo
    a h c8. h16 a8 g f4
    e c8 h a4 c
  }
}

BassoLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus Do -- mi -- no me --
  o: Se -- de, se -- de a
  dex -- tris me -- is, e --
  mit -- tet Do -- mi -- nus ex Si --
  on: in splen -- do -- "ri -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8-\tutti c' h g e c g' g,
    e' c f d g e a f
    h g e c' g g, r g-\solo
    a h c c'16 h a8 g f4
    e8. d16 c8 h a4 c
  }
}

BassFigures = \figuremode {
  r2. <3>4
  r <6> q q
  q1
  <6>2. <7>8 <6>
  <_+>4 r2 <6>8 <5>
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
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
