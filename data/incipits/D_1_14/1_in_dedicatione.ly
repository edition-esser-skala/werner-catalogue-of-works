\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    r16 g'\f h c d8 d d16 g h a g8 fis
    g g, h g d' fis g h
    a16 fis32 g a16 fis d8 g~ g fis e a
    fis16 d' d d d8 d, r16 d d d d8 d,
    r a' a a dis4. dis8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    r16 g'\f h a g8 a h h16 c d8 a
    h h r4 fis8 d4 d'8
    d,16 d'32 e fis16 d h8. h16 e8 d4 cis8
    d16 fis fis fis fis8 h, r16 fis fis fis fis8 g
    fis fis r4 r8 fis fis fis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    r8 d'^\tutti g, a h h16[ c] d8 a
    h h h g d'2
    d4 r8 e4 d16 d d8[ cis]
    d a4 h8 a d4 h8
    a a a a dis4. dis8
  }
}

SopranoLyrics = \lyricmode {
  In de -- di -- ca -- ti -- o -- ne
  tem -- pli de -- can -- ta --
  bat po -- pu -- lus lau --
  dem et in o -- re e --
  o -- rum dul -- cis re -- "so -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    r8 g'^\tutti d d d g g fis
    g g r4 fis8 d g h
    a fis d g g fis16 fis e4
    fis8 fis4 g8 fis fis4 g8
    fis fis r4 r8 fis4 fis8
  }
}

AltoLyrics = \lyricmode {
  In de -- di -- ca -- ti -- o -- ne
  tem -- pli de -- can -- ta -- bat,
  de -- can -- ta -- bat po -- pu -- lus lau --
  dem et in o -- re e --
  o -- rum dul -- cis
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    r8 h^\tutti d d d8. d16 d8 d
    d d r4 r h8 g
    d'4 h a8 a16 a a4
    a8 d4 d8 d d r d
    d d r4 r8 a4 a8
  }
}

TenoreLyrics = \lyricmode {
  In de -- di -- ca -- ti -- o -- ne
  tem -- pli de -- can --
  ta -- bat po -- pu -- lus lau --
  dem et in o -- re e --
  o -- rum dul -- cis
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    r8 g'^\tutti h fis g8. g16 h,8 d
    g, g r4 r2
    fis'8 d g e cis d16 d a4
    d d8 g d4 d8 g,
    d' d r4 r8 c'!4 c8
  }
}

BassoLyrics = \lyricmode {
  In de -- di -- ca -- ti -- o -- ne
  tem -- pli
  de -- can -- ta -- bat po -- pu -- lus lau --
  dem et in o -- re e --
  o -- rum dul -- cis
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    g8-\tutti g' h fis g g, h d
    g4 \clef soprano << { h'8 g d'4 } \\ { r4 fis,8[ d] } >> \clef tenor h g
    \clef bass fis d g e cis d a4
    d4. g8 d4. g8
    d4 r r8 c'!4 c8
  }
}

BassFigures = \figuremode {
  r1
  r2. <6>4
  q2 <6 5>4 <4>8 <_+>
  r1
  r2 r8 <4\+ 2\+>4.
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
