\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "Un poco allegro"
    b'2 b4
    c2 c4
    d2 d4
    f2 es4\trill
    d2 r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "Un poco allegro"
    f2 f4
    f2 f4
    f2 b4
    g2 c4
    f,2 r4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 3/4 \tempoMarkup "Un poco allegro" \autoBeamOff
    b'2 b4
    c2 c4
    d2 d4
    f2 es4\trill
    d2 r4
  }
}

SopranoLyrics = \lyricmode {
  Ho -- mo
  qui -- dam
  fe -- cit
  coe -- _
  nam,
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 3/4 \tempoMarkup "Un poco allegro" \autoBeamOff
    f2 f4
    f2 f4
    f2 b4
    g2 c4
    f,2 r4
  }
}

AltoLyrics = \lyricmode {
  Ho -- mo
  qui -- dam
  fe -- cit
  coe -- _
  nam,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 3/4 \tempoMarkup "Un poco allegro" \autoBeamOff
    d2 d4
    c2 c4
    b2 b4
    b2 a4
    b2 r4
  }
}

TenoreLyrics = \lyricmode {
  Ho -- mo
  qui -- dam
  fe -- cit
  coe -- _
  nam,
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 3/4 \tempoMarkup "Un poco allegro" \autoBeamOff
    b'2 b4
    a2 a4
    b2 b4
    c2 f,4
    b2 r4
  }
}

BassoLyrics = \lyricmode {
  Ho -- mo
  qui -- dam
  fe -- cit
  coe -- _
  nam,
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 3/4 \tempoMarkup "Un poco allegro"
    b8 b'16 a b8 c d b
    a a16 g a8 f g a
    b b16 a b8 c d b
    c c16 b c8 c, f, f'
    b, b'16 a b8 f d f
  }
}

BassFigures = \figuremode {
  r2 <6>4
  q2.
  r2 q4
  <7>2 <7>4
  r2.
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
