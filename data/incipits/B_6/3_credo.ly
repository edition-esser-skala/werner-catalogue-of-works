\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Allegro"
    fis16 a d a d a' fis a e a d, a'
    cis, a' e cis a a' fis a e a d, a'
    cis, a cis e a a, fis a e a d, a'
    cis, a cis e a fis a d fis a d, fis
    h, g h e g h e, g cis, a cis fis
    a cis fis, a d, fis h, e cis a cis d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Allegro"
    fis16 a d a d a' fis a e a d, a'
    cis, a' e cis a a' fis a e a d, a'
    cis, a cis e a a, fis a e a d, a'
    cis, a cis e a fis a d fis a d, fis
    h, g h e g h e, g cis, a cis fis
    a cis fis, a d, fis h, e cis a cis d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
    d'4^\tutti d8 d e d
    cis4 cis8 d e d
    cis4 cis8 a a4
    a8 a4 d h8~
    h e e cis4 fis8
    fis d4 e8 cis8.[ d16]
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae, vi -- si -- bi --
  li -- um o -- mni --
  um et in -- "vi -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
    fis4^\tutti fis8 fis a fis
    e4 e8 fis a fis
    e4 e8 d e[ d]
    cis4 r8 fis4 d8~
    d g4 e8 e a~
    a fis fis h e, a
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae, vi -- si --
  bi -- li -- um o --
  mni -- um et in -- "vi -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
    a4^\tutti a8 a cis a
    a4 a8 a cis a
    a4 a8 a a[ fis]
    e4 a4. d8
    h4 h8 e cis8. cis16
    a4 r8 h a4
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae, vi -- si --
  bi -- li -- um o -- mni --
  um et "in -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
    d4^\tutti d8 d cis d
    a'4 a8 d cis d
    a4 a8 fis cis[ d]
    a4 fis' d
    g8 g e4 a8. a16
    fis4 h8 gis a[ fis]
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae, vi -- si --
  bi -- li -- um o -- mni --
  um et in -- "vi -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \tempoMarkup "Allegro"
    d4.-\tutti d'8 cis d
    a4. d8 cis d
    a4. fis8 cis d
    a4 fis' d
    g e a
    fis h8 gis a fis
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r4 <5>8 <6> <5> <6>
  <5> <6> <5> <6> <5> <6>
  <5> <6>4 r4.
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
