\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Vivace"
    d'8. d16 d8 fis d h
    cis16 h cis d cis8 e cis a
    h4. g16 a h8 cis
    d4 a8. h32 cis d4~
    d8 cis16 h cis d cis d e4
    a,8 d16 e fis8 d16 e fis8 d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Vivace"
    R2.*2
    g'8. g16 g8 h g e
    fis16 e fis g fis8 a fis d
    e8 a, a' g g fis16 e
    fis g fis e d4 r8 h'
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    d'8.^\tutti d16 d8 fis d[ h]
    cis16[ h cis d] cis8[ e cis a]
    h4. g16[ a] h8[ cis]
    d4 a8.[ h32 cis] d4~
    d8[ cis16 h] cis[ d cis d] e4
    a,8 d16[ e] fis8[ d16 e] fis8[ d]
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  _ _
  son, e -- lei --
  son, e -- lei --
  _ _
  son, e -- lei \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    R2.*2
    g'8.^\tutti g16 g8 h g[ e]
    fis16[ e fis g] fis8[ a fis d]
    e8 a, a'[ g] g[ fis16 e]
    fis[ g fis e] d4 r8 h'
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  _ _
  son, e -- lei -- _
  _ son, "Chri -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    R2.*5
    d8.^\tutti d16 d8 fis d[ h]
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- "lei -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    R2.*6
  }
}

BassoLyrics = \lyricmode {
  %tacet
}

Organo = {
  \relative c {
    \clef soprano
    \key d \major \time 3/4 \tempoMarkup "Vivace"
    d''8.-!-\tutti d16-! d8-! fis-! d-! h-!
    cis16 h cis d cis8 e cis a
    << {
      h4. g'8 h, cis
      d4 a8. h32 cis d4~
      d8 cis16 h cis d cis d e4
    } \\ {
      g,8. g16 g8 h g e
      fis16 e fis g fis8 a fis d
      e a, a' g g fis16 e
    } >>
    \clef tenor d8. d16 d8 fis d h
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  r
  r2 <6>4
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
