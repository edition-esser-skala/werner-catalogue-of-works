\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Andante"
    r2 r8 c\f g'16 a \once \tieDashed b8~
    b a r c4\p d,8 r d'~
    d e, r4 r2
    r4 r8 c' d e16 f e8 d
    c4 h8. c16 c8 c, g'16 a b8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Andante"
    r2 r8 c\f g'16 a b8~
    b a r c4\p d,8 r d'~
    d e, r4 r2
    r4 r8 a h c16 d c8 a
    g4. d8 e e16 f g a b8
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    f4.^\solo g16[ a] g8 c, r4
    r8 c f g16 a d,[ c] d8 r b'16[ g]
    e[ d] e8 r f d e16 f \appoggiatura c b8. a16
    a8 c f g16 a g4. a16 f
    e4 d8. c16 c4 r
  }
}

AltoLyrics = \lyricmode {
  Be -- ne -- di -- ctus,
  qui ve -- nit, qui ve -- nit, qui
  ve -- nit in no -- mi -- ne Do -- mi --
  ni, qui ve -- nit in no -- mi -- ne
  Do -- _ mi -- ni,
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Andante"
    f,8-\solo f'16 g a8 f c e16 d e8 c
    f f,16 g a8 f b b'16 a b8 g
    c, c'16 b c8 a b a g c,
    f e d c h g c f
    g f g g, c c16 d e8 c
  }
}

BassFigures = \figuremode {
  r2.. <7>8
  <4> <3>4. <9>8 <8>4.
  <9>8 <8>4 <6>4 r8 <7> q
  r r4 <6>8 q4. q8
  <6 4>4 <5 _!> r4. <7->8
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
