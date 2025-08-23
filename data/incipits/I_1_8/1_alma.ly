\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    c'4.^\solo c8 h a g f
    e4 fis\trill g r
    r8 c c c16 c h8 d g, d'
    e4 e, r e'
    e8[ c] h[ a] f'2
  }
}

SopranoLyrics = \lyricmode {
  Al -- ma Re -- dem -- pto -- ris
  Ma -- _ ter,
  quae per -- vi -- a coe -- li por -- ta
  ma -- nes et
  stel -- la "ma -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    R1
    c'4.^\solo c8 h a g f
    e4 fis\trill g r
    r8 a a a16 a gis8 h e, h'
    c a r a a[ f] e[ d]
  }
}

AltoLyrics = \lyricmode {
  Al -- ma Re -- dem -- pto -- ris
  Ma -- _ ter,
  quae per -- vi -- a coe -- li por -- ta
  ma -- nes et stel -- la
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Largo"
    c4-\solo e8 c g'2
    a g4 h,
    c a g h
    c4. d8 e4 gis
    a2 d,
  }
}

BassFigures = \figuremode {
  r1
  <5>4 <6\\>2.
  r4 <6\\>2.
  <5>8 <6>4 r8 <_+>2
  r1
}

\score {
  <<
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
