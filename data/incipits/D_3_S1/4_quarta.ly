\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Un poco allegro"
    g'2 c4
    \grace h8 a4 g r
    a f' \grace e8 d4
    \grace c8 h8. c32 d c4 r
    e2 fis4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Un poco allegro"
    e2 g4
    \grace g8 f4 e r
    f2 f4
    f e r
    g2 a4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \tempoMarkup "Un poco allegro" \autoBeamOff
    g'2 c4
    \grace h8 a4 g r
    a f' \grace e8 d4
    \grace c8 h8.[ c32 d] c4 r
    e2 fis4
  }
}

SopranoLyrics = \lyricmode {
  Hic est
  pa -- nis,
  pa -- _ nis
  vi -- vus
  qui de
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \tempoMarkup "Un poco allegro" \autoBeamOff
    e2 g4
    \grace g8 f4 e r
    f2 f4
    f e r
    g2 a4
  }
}

AltoLyrics = \lyricmode {
  Hic est
  pa -- nis,
  pa -- nis
  vi -- vus
  qui de
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \tempoMarkup "Un poco allegro" \autoBeamOff
    c2 c4
    c c r
    a2 a4
    g g r
    c2 c8[ d]
  }
}

TenoreLyrics = \lyricmode {
  Hic est
  pa -- nis,
  pa -- nis
  vi -- vus
  qui de
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Un poco allegro" \autoBeamOff
    c2 e4
    f c r
    f d8[ e] f[ e16 f]
    g4 c, r
    c4. h8 a[ d]
  }
}

BassoLyrics = \lyricmode {
  Hic est
  pa -- nis,
  pa -- _ nis
  vi -- vus
  qui _ de
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Un poco allegro"
    c8 c16 h c8 d e c
    f a16 h c8 g e c
    f, f'16 e d8 e f e16 f
    g8 g, c c16 d e8 d
    c c'16 h c8 h a d
  }
}

BassFigures = \figuremode {
  r2 <6>4
  r2.
  r2 r8 <6>
  <7>2.
  r2 <6\\>4
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
