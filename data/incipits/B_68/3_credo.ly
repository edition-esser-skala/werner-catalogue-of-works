\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "[no tempo]"
    R1.*5
    r4 h'2-\solo a8 h c d e fis
    g a h2 a4 g2\trill
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/2 \tempoMarkup "[no tempo]"
    R1.*5
    r4 g'2 fis8 g a h c4
    h g8 a h cis d2 \hA cis4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    g'2^\solo d'4 e h8[ c] h[ c]
    d4 g, r d' e fis
    g2 e4 d d cis
    d2 r r
    R1.*3
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter -- _
  rae,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1.*2
    r2 r g'4^\solo g
    fis g8 a g4 g8 fis e2
    a4 fis8[ e] dis4 e e4. dis8
    e2 r r
    r r e4 e8 e
  }
}

AltoLyrics = \lyricmode {
  vi -- si --
  bi -- li -- um o -- mni -- um et,
  et in -- vi -- si -- bi -- li --
  um.
  Fi -- li -- um
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1.*2
    r4 h^\solo cis d e2
    a, r r
    R1.*3
  }
}

TenoreLyrics = \lyricmode {
  fa -- cto -- rem ter --
  rae,
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1.
    r4 g'^\solo a h c2
    h4 g a fis e2
    d r r
    r h4 e h' h
    g8[ a g fis] e[ d! c h] a4. a8
    g4 g'2 fis4 e2
  }
}

BassoLyrics = \lyricmode {
  fa -- cto -- rem coe --
  li, coe -- li et ter --
  rae,
  Et in u -- num
  Do -- _ _ mi --
  num Je -- sum "Chri -"
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \tempoMarkup "[no tempo]"
    g4.-\solo a8 h4 c e d8 c
    h4 e d g c2
    h4 g a fis e2
    d4 d' h g c a
    fis a h e, h2
    e4. fis8 e d! c h a2
    g4 g'2 fis4 e2
  }
}

BassFigures = \figuremode {
  r1 <5>2
  <6>1 <3>4 <4\+>
  <6>2 <_+> <7>4 <6\\>
  r1.
  r4 <6> <_+>2 <4>4 <_+>
  r1 <7>4 <6>
  r1 <7>4 <6\\>
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
