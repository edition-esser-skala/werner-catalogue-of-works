\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Alla breve · Allegro"
    g'2 a
    g4 c2 h4
    a d2 cis4
    d2 r
    R1*2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Alla breve · Allegro"
    r4 g'2 fis4
    e a fis g~
    g fis g4. g8
    fis4 r a2
    gis4 a h4. h8
    ais4 h2 a4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Alla breve · Allegro"
    g'2 a
    g4 c c h
    a d d cis
    d2 r
    R1*2
  }
}

SopranoLyrics = \lyricmode {
  Sub tu --
  um prae -- si -- di --
  um con -- fu -- gi --
  mus,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Alla breve · Allegro"
    r4 g'2 fis4
    e a fis g~
    g fis g4. g8
    fis4 r a2
    gis4 a h4. h8
    ais4 h2 a4
  }
}

AltoLyrics = \lyricmode {
  Sub tu --
  um, tu -- um prae --
  _ si -- di --
  um, tu --
  um prae -- si -- di --
  um con -- "fu -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Alla breve · Allegro"
    R1*2
    r2 r4 g
    h2 a4 d
    d c d e~
    e d c!4. c8
  }
}

TenoreLyrics = \lyricmode {
  Sub
  tu -- um prae --
  si -- di -- um con --
  _ fu -- "gi -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Alla breve · Allegro"
    R1*2
    d2 e
    d4 g g f
    e a a g!
    fis! g e fis
  }
}

BassoLyrics = \lyricmode {
  Sub tu --
  um prae -- si -- di --
  um, prae -- si -- di --
  um con -- fu -- "gi -"
}

Organo = {
  \relative c {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "Alla breve · Allegro"
    << {
      g''2 a
      c2. h4
    } \\ {
      r4 g2 fis4
      e a fis g
    } >>
    \clef bass d,2 e
    d4 g2 f4
    e a2 g!4
    fis! g e fis
  }
}

BassFigures = \figuremode {
  r1
  r
  <4>4 <_+> <7> <6\\>
  <6> <3> <2> <6>
  <7 _+> <3> <4 2> <6>
  <7 _+> <5> <6 5> <\t>
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
