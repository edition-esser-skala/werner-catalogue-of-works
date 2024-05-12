\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r16 c'32\f d e16 d e g d g e c,32 d e16 d e g d g
    e c'32 d e16 d e g d g e g c a d a h g
    fis d fis a d a fis d r d gis h c, e a c
    h gis e h e h gis e c' a c e a c, h g'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    r16 e32\f f g8~ g h c16 e,32 f g8~ g h
    c,16 e32 f g8~ g h c16 e8 c16 a d8 h16
    a fis a d fis d a fis gis h8 d16 e, c'8 e16
    e, e' h gis h gis e h' e, c a c' d a g h
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 r8 h'^\tutti c8. c16 c8 d
    e8. e16 e8 d e4 d8 d
    d8. d16 d8 d d d c c
    h8. h16 h4 c8 c c h
  }
}

SopranoLyrics = \lyricmode {
  Coe -- le -- sti -- a, coe --
  le -- sti -- a mor -- ta -- les sunt
  a -- pe -- ten -- da re -- gna, a -- pe --
  ten -- da re -- gna, in is -- ta
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 r8 g'^\tutti g8. g16 g8 g
    g8. g16 g8 g g[ e] a g
    fis8. fis16 fis8 fis gis gis a a
    h8. h16 h8[ gis] e a a g
  }
}

AltoLyrics = \lyricmode {
  Coe -- le -- sti -- a, coe --
  le -- sti -- a mor -- ta -- les sunt
  a -- pe -- ten -- da re -- gna, a -- pe --
  ten -- da re -- gna, in is -- ta
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 r8 d^\tutti e8. e16 e8 h
    c8. c16 c8 h c4 c8 h
    a8. a16 a8 a h h c c
    e8. e16 e4 e8 e d d
  }
}

TenoreLyrics = \lyricmode {
  Coe -- le -- sti -- a, coe --
  le -- sti -- a mor -- ta -- les sunt
  a -- pe -- ten -- da re -- gna, a -- pe --
  ten -- da re -- gna, in is -- ta
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    r4 r8 g'^\tutti c8. c16 c8 g
    c,8. c16 c8 g' c[ a] fis g
    d8. d16 d8 c' h h a a
    gis8. gis16 gis4 a8 a fis g
  }
}

BassoLyrics = \lyricmode {
  Coe -- le -- sti -- a, coe --
  le -- sti -- a mor -- ta -- les sunt
  a -- pe -- ten -- da re -- gna, a -- pe --
  ten -- da re -- gna, in is -- ta
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro"
    c8-\tutti c'16 h c8 g c, c'16 h c8 g
    c, c'16 h c8 g c, a' fis g
    d d'4 c8 h h a a
    gis gis gis gis a a fis g
  }
}

BassFigures = \figuremode {
  r1
  r2. <6>4
  <_+>4. <\t>8 <6\\>2
  r2. <6 5>4
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
