\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    r16^\conSord g'' e16. c32 g16. e'32 c16. g32 e4 r
    r2 r16 g'8 e c g16
    a4 r r16 a'8 f d a16
    g4 r r2
    r16 e'8 g e c16 f4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    r16^\conSord e' c16. g32 e16. c'32 g16. e32 c4 r
    r2 r16 e'8 c g e16
    e4 r r16 f'8 d a f16
    d4 r r2
    r16 c'8 e c g16 a4 r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Recitativo" \autoBeamOff
    r4 r8 g' c c e g
    h, d f e c c r4
    a8 cis e a, f'8. f16 f4
    r8 g, h16 h h c d8 d f e
    c c r4 c8 c f c
  }
}

SopranoLyrics = \lyricmode {
  Ma -- ri -- a Wur -- zel
  Da -- vids ſey ge -- grüſ -- ſet!
  die du voll der Gna -- de biſt.
  Wo die ge -- be -- ne -- dey -- te Frucht her --
  sprüſ -- ſet, dei -- nes Lei -- bes
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    c4 r c2
    d e
    cis d
    h1
    c2 a
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r
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
