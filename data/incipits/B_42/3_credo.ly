\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Andante"
    R1.
    r2 d' cis4 a
    h cis d2 d
    r4 d2 h4 e4. e8
    cis4 cis d4. d8 h4 e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "Andante"
    g'2 fis4 d e fis
    g e fis fis g a~
    a g fis g2 fis4
    g2 r4 h2 g4
    e a2 fis4 d g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.
    r2 d'^\tutti cis4 a
    h cis d2 d
    r4 d2 h4 e4. e8
    cis4 cis d4. d8 h4 e
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten -- tem,
  vi -- si -- bi -- li --
  um o -- _ mni -- um et
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    g'2^\tutti fis4 d e fis
    g e fis fis g a~
    a g fis g g fis
    g2 r4 h2 g4
    e a2 fis4 d g~
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- _ tem, fa -- cto -- rem __
  coe -- li et ter -- _
  rae, et in --
  vi -- _ si -- "bi -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    r2 d^\tutti cis4 a
    h cis d a r d
    h e a, h8 h a2
    h r h4 h
    cis4. cis8 a4 a h4. h8
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten -- tem, fa --
  cto -- rem coe -- li et ter --
  rae, vi -- si --
  bi -- li -- um o -- _ "mni -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.
    g'2^\tutti fis4 d e fis
    g e d1
    g,2 r4 g'2 e4
    a4. a8 fis4 fis g4. g8
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, cre --
  do, vi -- si --
  bi -- li -- um o -- _ "mni -"
}

Organo = {
  \relative c {
    \clef alto
    \key g \major \time 3/2 \tempoMarkup "Andante"
    << { g''2 fis4 d e fis } \\ { r2-\tutti d cis4 a } >>
    \clef bass g2 fis4 d e fis
    g e d1
    g,2 r4 g'2 e4
    a4. a8 fis4 fis g4. g8
  }
}

BassFigures = \figuremode {
  r1.
  <3>4 <4\+> <6>2 <6\\>4 <6>
  <9> <3 6\\> <_+> <6 4> <5 \t> <\t _+>
  r2. <5>4 <6>2
  <_+> r <5>4 <6>
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
        \set Staff.instrumentName = \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "T" "trb 2" }
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
