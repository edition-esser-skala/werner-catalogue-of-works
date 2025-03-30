\version "2.24.2"
\include "header.ly"

sempreP = \markup \remark \whiteout \pad-markup #0.5 \concat { "sempre " \bold \fontsize #2 "p" }

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro moderato"
    r4 e'-\sempreP f, d'
    r2 r4 c
    d16 e f8~ f d e g c,4
    r2 r8 h' h h
    c,4 r r2
    r4 g a16 h c8~ c a
    h d g, c~ c h16 a h4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Allegro moderato"
    r2 r4 d'-\sempreP
    e, c' r2
    r r4 g
    a16 h c4 a8 h d g,4
    r8 a' a a h,4 r
    R1
    r4 c d16 e f!4 d8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Allegro moderato" \autoBeamOff
    R1*3
    r2 g'^\solo
    a h4 c~
    c8 c h4 a2
    g r
  }
}

SopranoLyrics = \lyricmode {
  A --
  ve Re -- gi --
  na coe -- lo --
  rum,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Allegro moderato" \autoBeamOff
    c2^\solo d
    e4 f4. f8 e4
    d2\trill c
    R1*4
  }
}

AltoLyrics = \lyricmode {
  A -- ve
  Re -- gi -- na coe --
  lo -- rum,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Allegro moderato"
    c4-\solo c'2 h4
    c a g a
    f g c,4. h8
    a2 g4 g'~
    g fis g e
    d e c d
    g e d2
  }
}

BassFigures = \figuremode {
  r4 <3> <2>2
  r4 <6> <7> <5>
  <6 5>1
  <7>4 <6\\>2.
  <2> <6>4
  <7 _+> <5> <6 5> <_+>
  r2 <7>4 <6>
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
