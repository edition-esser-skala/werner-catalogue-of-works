\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Largo"
    r16 a'' a16. fis32 fis16. d32 d8\trill r16 h' h16. g32 g16. d32 d8\trill
    r16 d d8\trill r16 d' d8\trill r16 c c8 r16 dis, dis8
    r16 h'32 a gis16 h e, \hA gis h, e gis,16. f'32 f8\trill r4
    r16 a,8 cis!16 e a e cis ais16. g'32 g8\trill r4
    r16 h,8 dis fis a!16 c dis,8 dis dis dis16
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Largo"
    r16 fis' fis16. d32 d16. a32 fis8\trill r16 g' g16. d32 d16. h32 h8\trill
    r16 a a8\trill r16 h' h8\trill r16 e, e8 r16 fis, fis8
    r16 gis'32 fis e16 \hA gis h, e gis, h d,16. d'32 d8\trill r4
    r16 a8 cis!16 e a e cis ais16. e'32 e8 r4
    r16 fis,8 h dis fis16 a!8 fis, fis fis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    r4 a'^\tutti h4. cis16[ d]
    a8[ d,] d'4 c2\trill
    h4 r r8 d d d
    d[ cis!] cis4 r8 e e e
    e[ dis] dis4 r8 \hA dis dis dis
  }
}

SopranoLyrics = \lyricmode {
  San -- _ _
  _ _ _
  ctus Do -- mi -- nus
  De -- us, Do -- mi -- nus
  De -- us, Do -- mi -- nus
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    r4 fis4^\tutti g8[ d] g4~
    g8 fis4 gis8 a4 fis
    gis r r8 f f f
    f[ e] e4 r8 g g g
    g[ fis] fis4 r8 fis fis fis
  }
}

AltoLyrics = \lyricmode {
  San -- _ _
  _ _ _ _
  ctus Do -- mi -- nus
  De -- us, Do -- mi -- nus
  De -- us, Do -- mi -- nus
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    a4^\tutti d2 d,4~
    d r8 d' e4 dis
    e r r8 gis, gis gis
    a4 a r8 ais ais ais
    h4 h r8 c c c
  }
}

TenoreLyrics = \lyricmode {
  San -- _ ctus, __
  san -- _ _
  ctus Do -- mi -- nus
  De -- us, Do -- mi -- nus
  De -- us, Do -- mi -- nus
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    d1~^\tutti
    d4 h a2
    e'4 r h2
    a cis!
    h r8 a' a a
  }
}

BassoLyrics = \lyricmode {
  San --
  ctus, san --
  ctus, san --
  ctus, san --
  ctus Do -- mi -- nus
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Largo"
    d1~-\tutti
    d4 h a2
    e4 r h'2
    a cis!
    h a
  }
}

BassFigures = \figuremode {
  <5 _+>2 <6 4>
  <5 4>8 <\t _+> <5> <6\\> <5 _ _!>4 <6 4\+ \t>
  <_+>2 <6\\ 5!>
  <8 6! 4>8 <_ 5 _+>4. <6\\ 5>2
  <8 6 4>8 <_ 5\+ _+>4. <6 4\+ _!>2
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
